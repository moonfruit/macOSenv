#!/usr/bin/env bash
# shellcheck disable=SC2317

set -u

# shellcheck disable=SC1091
source "$ENV/lib/bash/project-root.sh"

PASS=0
FAIL=0

assert_eq() {
    local actual=$1
    local expected=$2
    local label=$3
    if [[ $actual == "$expected" ]]; then
        echo "PASS: $label"
        PASS=$((PASS + 1))
    else
        echo "FAIL: $label"
        echo "  expected: $expected"
        echo "  actual:   $actual"
        FAIL=$((FAIL + 1))
    fi
}

assert_fail() {
    local label=$1
    shift
    if "$@" >/dev/null 2>&1; then
        echo "FAIL: $label (expected non-zero exit)"
        FAIL=$((FAIL + 1))
    else
        echo "PASS: $label"
        PASS=$((PASS + 1))
    fi
}

setup_tmp() {
    # realpath so the path matches what `to-absolute-path` (realpath) inside
    # project-root will produce on macOS where /var/folders/... is a symlink
    # to /private/var/folders/...
    realpath "$(mktemp -d -t project-root.XXXXXX)"
}

# --- 场景 1: git 仓库根 ---
test_git_root() {
    local d
    d=$(setup_tmp)
    git -C "$d" init -q
    local actual
    actual=$(cd "$d" && project-root)
    assert_eq "$actual" "$d" "git 仓库根"
    rm -rf "$d"
}

# --- 场景 2: git 仓库子目录 ---
test_git_subdir() {
    local d
    d=$(setup_tmp)
    git -C "$d" init -q
    mkdir -p "$d/sub/deeper"
    local actual
    actual=$(cd "$d/sub/deeper" && project-root)
    assert_eq "$actual" "$d" "git 仓库子目录"
    rm -rf "$d"
}

# --- 场景 3: git + .claude/ 在子目录（git 优先）---
test_git_priority_over_claude() {
    local d
    d=$(setup_tmp)
    git -C "$d" init -q
    mkdir -p "$d/.claude"
    local actual
    actual=$(cd "$d" && project-root)
    assert_eq "$actual" "$d" "git 优先于 .claude"
    rm -rf "$d"
}

# --- 场景 4: 非 git + 含 .claude/ ---
test_claude_marker() {
    local d
    d=$(setup_tmp)
    mkdir -p "$d/.claude"
    local actual
    actual=$(cd "$d" && project-root)
    assert_eq "$actual" "$d" ".claude marker"
    rm -rf "$d"
}

# --- 场景 5: 非 git + 子目录向上找 .vscode/ ---
test_vscode_walk_up() {
    local d
    d=$(setup_tmp)
    mkdir -p "$d/.vscode" "$d/sub/deeper"
    local actual
    actual=$(cd "$d/sub/deeper" && project-root)
    assert_eq "$actual" "$d" "向上找 .vscode"
    rm -rf "$d"
}

# --- 场景 6: Gradle 单模块（仅 build.gradle）---
test_gradle_single() {
    local d
    d=$(setup_tmp)
    touch "$d/build.gradle"
    local actual
    actual=$(cd "$d" && project-root)
    assert_eq "$actual" "$d" "Gradle 单模块"
    rm -rf "$d"
}

# --- 场景 7: Gradle 多模块根（含 settings.gradle）---
test_gradle_multi_root() {
    local d
    d=$(setup_tmp)
    touch "$d/settings.gradle"
    touch "$d/build.gradle"
    mkdir -p "$d/sub"
    touch "$d/sub/build.gradle"
    local actual
    actual=$(cd "$d" && project-root)
    assert_eq "$actual" "$d" "Gradle 多模块根"
    rm -rf "$d"
}

# --- 场景 8: Gradle 多模块子模块 ---
test_gradle_multi_submodule() {
    local d
    d=$(setup_tmp)
    touch "$d/settings.gradle"
    mkdir -p "$d/sub"
    touch "$d/sub/build.gradle"
    local actual
    actual=$(cd "$d/sub" && project-root)
    assert_eq "$actual" "$d" "Gradle 多模块子模块"
    rm -rf "$d"
}

test_git_root
test_git_subdir
test_git_priority_over_claude
test_claude_marker
test_vscode_walk_up
test_gradle_single
test_gradle_multi_root
test_gradle_multi_submodule

echo "---"
echo "PASS: $PASS  FAIL: $FAIL"
exit $((FAIL > 0 ? 1 : 0))
