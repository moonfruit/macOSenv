# project-root Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a `project-root` bash library function and `find-project-root.sh` bin wrapper that finds the current project's root directory using a layered heuristic (git → IDE markers → language markers with multi-module awareness).

**Architecture:** Library file `lib/bash/project-root.sh` exposes a single public function `project-root [start-dir]`. Implementation follows a three-stage algorithm: (1) git rev-parse, (2) walk up looking for tool markers (`.claude`, `.vscode`, `.idea`, `.envrc`, `.lazy.lua`), (3) walk up looking for language markers with multi-module handling for Gradle (`settings.gradle` > `build.gradle`) and Maven (climb_pom). Thin bin wrapper re-exports the function for command-line use.

**Tech Stack:** Bash 3.2+ (macOS default), `git` (optional), `realpath`, `simple-dirname` from existing `lib/bash/native.sh`.

## Global Constraints

- Source-level dependencies: `lib/bash/native.sh` only (provides `simple-dirname`, `to-absolute-path`, `has-command`).
- Library file header MUST follow existing `lib/bash/*.sh` convention:
  ```bash
  #!/bin/bash
  [[ -z ${__ENV_LIB_PROJECT_ROOT:-} ]] && __ENV_LIB_PROJECT_ROOT=1 || return 0
  source "$ENV/lib/bash/native.sh"
  ```
- Naming: kebab-case functions; public function is `project-root`; private helpers prefixed implicitly by being lowercase (`climb_pom`, `climb_for_settings`).
- Behavior contract: success → stdout absolute path + return 0; failure → empty stdout + return 1; stderr is silent by default.
- Marker set (immutable, NOT user-extensible per spec):
  - Tool: `.claude`, `.vscode`, `.idea`, `.envrc`, `.lazy.lua`
  - Gradle: `settings.gradle`, `settings.gradle.kts`, `build.gradle`, `build.gradle.kts`
  - Maven: `pom.xml`
  - Other: `package.json`, `go.mod`, `pyproject.toml`, `venv`, `Cargo.toml`
- No modification to any existing files.

---

## File Structure

| File | Responsibility |
|---|---|
| `lib/bash/project-root.sh` (new) | Library — defines `project-root`, `climb_pom`, `climb_for_settings` |
| `bin/find-project-root.sh` (new) | Thin wrapper that sources the library and forwards args to `project-root` |
| `lib/bash/test/test-project-root.sh` (new) | Smoke tests covering the 15 scenarios from the spec |

---

### Task 1: Library skeleton + git + tool markers

**Files:**
- Create: `lib/bash/project-root.sh`
- Create: `lib/bash/test/test-project-root.sh`

**Interfaces:**
- Consumes: `simple-dirname`, `to-absolute-path`, `has-command` from `lib/bash/native.sh`
- Produces:
  - `project-root [start-dir]` — stdout absolute path, return 0; or empty stdout, return 1
  - `climb_pom start` (stubbed as no-op echo for now; implemented in Task 3)
  - `climb_for_settings start` (stubbed as no-op echo for now; implemented in Task 2)

- [ ] **Step 1: Create the library file with header + git stage + tool-marker stage**

Create `lib/bash/project-root.sh`:

```bash
#!/bin/bash
# shellcheck disable=SC2155

[[ -z ${__ENV_LIB_PROJECT_ROOT:-} ]] && __ENV_LIB_PROJECT_ROOT=1 || return 0

source "$ENV/lib/bash/native.sh"

project-root() {
    local start=${1:-$PWD}
    start=$(to-absolute-path "$start") || return 1
    [[ -d $start ]] || return 1

    # 阶段 1: git
    if has-command git; then
        local git_root
        if git_root=$(git -C "$start" rev-parse --show-toplevel 2>/dev/null) && [[ -n $git_root ]]; then
            echo "$git_root"
            return 0
        fi
    fi

    # 阶段 2: 工具标志
    local d
    d=$start
    while [[ $d != "/" ]]; do
        if [[ -d $d/.claude || -d $d/.vscode || -d $d/.idea \
            || -f $d/.envrc || -f $d/.lazy.lua ]]; then
            echo "$d"
            return 0
        fi
        d=$(simple-dirname "$d")
    done

    # 阶段 3: 语言标志（Gradle/Maven/其他）
    d=$start
    while [[ $d != "/" ]]; do
        if [[ -f $d/settings.gradle || -f $d/settings.gradle.kts ]]; then
            echo "$d"
            return 0
        fi
        if [[ -f $d/build.gradle || -f $d/build.gradle.kts ]]; then
            local r
            r=$(climb_for_settings "$d")
            if [[ -n $r ]]; then
                echo "$r"
            else
                echo "$d"
            fi
            return 0
        fi
        if [[ -f $d/pom.xml ]]; then
            climb_pom "$d"
            return 0
        fi
        if [[ -f $d/package.json || -f $d/go.mod || -f $d/pyproject.toml \
            || -d $d/venv || -f $d/Cargo.toml ]]; then
            echo "$d"
            return 0
        fi
        d=$(simple-dirname "$d")
    done

    return 1
}

climb_pom() {
    # TODO(task-3): implement climb_pom
    echo "$1"
}

climb_for_settings() {
    # TODO(task-2): implement climb_for_settings
    return 1
}
```

- [ ] **Step 2: Create the test file with scenarios 1–5**

Create `lib/bash/test/test-project-root.sh`:

```bash
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
    mktemp -d -t project-root.XXXXXX
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

test_git_root
test_git_subdir
test_git_priority_over_claude
test_claude_marker
test_vscode_walk_up

echo "---"
echo "PASS: $PASS  FAIL: $FAIL"
exit $((FAIL > 0 ? 1 : 0))
```

- [ ] **Step 3: Run tests; verify all 5 pass**

Run: `bash "$ENV/lib/bash/test/test-project-root.sh"`
Expected:
```
PASS: git 仓库根
PASS: git 仓库子目录
PASS: git 优先于 .claude
PASS: .claude marker
PASS: 向上找 .vscode
---
PASS: 5  FAIL: 0
```

If any fail, debug `project-root` and re-run.

- [ ] **Step 4: Commit**

```bash
git add lib/bash/project-root.sh lib/bash/test/test-project-root.sh
git commit -m "feat(bash): add project-root library skeleton + git/tool-marker stages"
```

---

### Task 2: Gradle multi-module handling (`climb_for_settings`)

**Files:**
- Modify: `lib/bash/project-root.sh` (replace `climb_for_settings` stub)
- Modify: `lib/bash/test/test-project-root.sh` (add scenarios 6–8)

**Interfaces:**
- Consumes: `simple-dirname` from native.sh
- Produces: `climb_for_settings start` — echoes the parent directory that contains `settings.gradle`/`settings.gradle.kts`; returns 1 if none found

- [ ] **Step 1: Add test cases 6–8 (Gradle) at the end of the file, before the final summary block**

Insert before the line `echo "---"` in `lib/bash/test/test-project-root.sh`:

```bash
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

test_gradle_single
test_gradle_multi_root
test_gradle_multi_submodule
```

- [ ] **Step 2: Run tests; verify scenarios 6 and 7 pass, scenario 8 fails**

Run: `bash "$ENV/lib/bash/test/test-project-root.sh"`
Expected:
```
PASS: Gradle 单模块
PASS: Gradle 多模块根
FAIL: Gradle 多模块子模块
  expected: <d>
  actual:   <d>/sub
---
PASS: 7  FAIL: 1
```

(The stub `climb_for_settings` returns 1 immediately, so the function echoes the current dir, hence the FAIL.)

- [ ] **Step 3: Implement `climb_for_settings`**

Replace the stub in `lib/bash/project-root.sh`:

```bash
climb_for_settings() {
    local d
    d=$(simple-dirname "$1")
    while [[ $d != "/" ]]; do
        if [[ -f $d/settings.gradle || -f $d/settings.gradle.kts ]]; then
            echo "$d"
            return 0
        fi
        d=$(simple-dirname "$d")
    done
    return 1
}
```

- [ ] **Step 4: Run tests; verify all 8 pass**

Run: `bash "$ENV/lib/bash/test/test-project-root.sh"`
Expected: `PASS: 8  FAIL: 0`

- [ ] **Step 5: Commit**

```bash
git add lib/bash/project-root.sh lib/bash/test/test-project-root.sh
git commit -m "feat(bash): add Gradle multi-module handling in project-root"
```

---

### Task 3: Maven multi-module handling (`climb_pom`)

**Files:**
- Modify: `lib/bash/project-root.sh` (replace `climb_pom` stub)
- Modify: `lib/bash/test/test-project-root.sh` (add scenarios 9–10)

**Interfaces:**
- Produces: `climb_pom start` — echoes the deepest ancestor that contains `pom.xml` and whose parent does not contain `pom.xml`

- [ ] **Step 1: Add test cases 9–10 (Maven) before the final summary**

Insert before `echo "---"`:

```bash
# --- 场景 9: Maven 单模块（含 pom.xml，父目录无）---
test_maven_single() {
    local d
    d=$(setup_tmp)
    touch "$d/pom.xml"
    local actual
    actual=$(cd "$d" && project-root)
    assert_eq "$actual" "$d" "Maven 单模块"
    rm -rf "$d"
}

# --- 场景 10: Maven 多模块（嵌套 pom.xml）---
test_maven_multi() {
    local d
    d=$(setup_tmp)
    touch "$d/pom.xml"
    mkdir -p "$d/sub"
    touch "$d/sub/pom.xml"
    local actual
    actual=$(cd "$d/sub" && project-root)
    assert_eq "$actual" "$d" "Maven 多模块子模块"
    rm -rf "$d"
}

test_maven_single
test_maven_multi
```

- [ ] **Step 2: Run tests; verify scenario 9 passes, scenario 10 fails**

Run: `bash "$ENV/lib/bash/test/test-project-root.sh"`
Expected: scenario 9 PASS, scenario 10 FAIL with `actual: <d>/sub`.

- [ ] **Step 3: Implement `climb_pom`**

Replace the stub in `lib/bash/project-root.sh`:

```bash
climb_pom() {
    local d=$1
    while [[ $(simple-dirname "$d") != "/" && -f "$(simple-dirname "$d")/pom.xml" ]]; do
        d=$(simple-dirname "$d")
    done
    echo "$d"
}
```

- [ ] **Step 4: Run tests; verify all 10 pass**

Run: `bash "$ENV/lib/bash/test/test-project-root.sh"`
Expected: `PASS: 10  FAIL: 0`

- [ ] **Step 5: Commit**

```bash
git add lib/bash/project-root.sh lib/bash/test/test-project-root.sh
git commit -m "feat(bash): add Maven multi-module climb_pom in project-root"
```

---

### Task 4: Mixed markers, other languages, edge cases, and bin wrapper

**Files:**
- Modify: `lib/bash/project-root.sh` (no functional change expected; verified by tests)
- Modify: `lib/bash/test/test-project-root.sh` (add scenarios 11–15)
- Create: `bin/find-project-root.sh`

- [ ] **Step 1: Add test cases 11–15 (mixed / other languages / edges / bin) before the final summary**

Insert before `echo "---"`:

```bash
# --- 场景 11: 含 package.json 但无工具标志 ---
test_package_json_only() {
    local d
    d=$(setup_tmp)
    touch "$d/package.json"
    local actual
    actual=$(cd "$d" && project-root)
    assert_eq "$actual" "$d" "package.json"
    rm -rf "$d"
}

# --- 场景 12: 同时含 .claude/ 和 pom.xml（工具标志优先）---
test_tool_marker_priority_over_language() {
    local d
    d=$(setup_tmp)
    mkdir -p "$d/.claude"
    touch "$d/pom.xml"
    local actual
    actual=$(cd "$d" && project-root)
    assert_eq "$actual" "$d" ".claude 优先于 pom.xml"
    rm -rf "$d"
}

# --- 场景 13: 啥都没有，遍历到 / ---
test_empty_returns_fail() {
    local d
    d=$(setup_tmp)
    local actual
    actual=$(cd "$d" && project-root)
    assert_eq "$actual" "" "空目录返回空字符串"
    assert_fail "空目录返回 exit 1" project-root
    rm -rf "$d"
}

# --- 场景 14: 起点参数为相对路径 ---
test_relative_start() {
    local d
    d=$(setup_tmp)
    mkdir -p "$d/.claude"
    local actual
    actual=$(cd "$d" && project-root ./)
    assert_eq "$actual" "$d" "相对路径起点"
    rm -rf "$d"
}

# --- 场景 15: bin/find-project-root.sh 端到端 ---
test_bin_wrapper() {
    local d
    d=$(setup_tmp)
    mkdir -p "$d/.claude"
    local actual
    actual=$(cd "$d" && "$ENV/bin/find-project-root.sh")
    assert_eq "$actual" "$d" "bin 包装"
    rm -rf "$d"
}

test_package_json_only
test_tool_marker_priority_over_language
test_empty_returns_fail
test_relative_start
test_bin_wrapper
```

- [ ] **Step 2: Run tests; verify scenarios 11, 12, 14, 15 pass; scenario 13 partially fails (because `bin/find-project-root.sh` does not exist yet)**

Run: `bash "$ENV/lib/bash/test/test-project-root.sh"`
Expected: scenarios 11, 12, 14 PASS. Scenario 13: the `assert_eq` for empty string should PASS, but the `assert_fail` wrapper check should FAIL with "no such file or directory" from the `project-root` invocation in the empty dir scenario? Actually scenario 13 will pass for the empty-string assertion because `project-root` returns empty stdout when nothing matches. The `assert_fail` checks `project-root` exits non-zero — this should also PASS.

So scenario 13 should fully PASS. Scenario 15 (bin) will FAIL because the bin script doesn't exist.

- [ ] **Step 3: Create `bin/find-project-root.sh`**

```bash
#!/usr/bin/env bash

# shellcheck disable=SC1091
source "$ENV/lib/bash/project-root.sh"
exec project-root "$@"
```

- [ ] **Step 4: Make it executable**

Run: `chmod +x "$ENV/bin/find-project-root.sh"`

- [ ] **Step 5: Run tests; verify all 15 pass**

Run: `bash "$ENV/lib/bash/test/test-project-root.sh"`
Expected: `PASS: 15  FAIL: 0` (counting both sub-asserts in scenario 13 as separate PASS lines).

- [ ] **Step 6: Manually smoke-test the bin script**

Run:
```bash
mkdir -p /tmp/proj-root-smoke/.claude/sub
cd /tmp/proj-root-smoke/sub
"$ENV/bin/find-project-root.sh"
```

Expected output: `/tmp/proj-root-smoke`

Then:
```bash
cd /tmp
"$ENV/bin/find-project-root.sh" /tmp/proj-root-smoke
```

Expected output: `/tmp/proj-root-smoke`

Cleanup: `rm -rf /tmp/proj-root-smoke`

- [ ] **Step 7: Commit**

```bash
git add bin/find-project-root.sh lib/bash/test/test-project-root.sh
git commit -m "feat(bash): add find-project-root.sh bin wrapper and full test coverage"
```

---

## Self-Review

**1. Spec coverage:**
- Purpose + user stories → Tasks 1–4 deliver the function and bin wrapper
- Behavior contract (function signature, silent failure, stdout-only on success) → Tasks 1 & 4 (test scenario 13 explicitly verifies failure semantics)
- Three-stage algorithm (git > tool > language) → Task 1 implements it; Task 2 (Gradle) and Task 3 (Maven) plug into the language stage
- Marker set (immutable) → enumerated in Tasks 1–3 and tested
- File structure (3 new files, 0 modifications) → matches Task headers
- climb_pom semantics → Task 3
- climb_for_settings semantics → Task 2
- 15 test scenarios from spec → distributed across Tasks 1–4
- YAGNI list (no custom markers, no JSON output, no auto-cd, etc.) → implementation in Tasks 1–3 honors these
- Dependencies → only `native.sh`; `git` is optional via `has-command`

**2. Placeholder scan:**
- No "TBD" / "TODO" remaining in task steps. (The `TODO(task-2)` / `TODO(task-3)` markers inside the stub functions in Task 1 are intentional scaffolding, explicitly replaced in Tasks 2 & 3.)

**3. Type/interface consistency:**
- `project-root` signature stable across all tasks.
- `climb_pom` and `climb_for_settings` stubs in Task 1 use the same signatures that Tasks 2 & 3 implement (`climb_pom echo`, `climb_for_settings return 1` are placeholders that compile in Task 1's test run).
- All test helpers (`assert_eq`, `assert_fail`, `setup_tmp`) defined once in Task 1 and reused.

**4. Scope:** Single feature, three small files, ~100 LOC total. Appropriate for one plan.