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
    local d=$1
    while [[ $(simple-dirname "$d") != "/" && -f "$(simple-dirname "$d")/pom.xml" ]]; do
        d=$(simple-dirname "$d")
    done
    echo "$d"
}

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
