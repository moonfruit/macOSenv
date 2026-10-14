#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(cd "$(dirname "$0")/../.." && pwd)
export CODEX_BIN="$repo_dir/tests/codex_wrapper/argv.sh"
unset CMUX_CODEX_PID CMUX_SURFACE_ID

check_args() {
    local expected=$1
    shift
    local actual
    actual=$(bash "$repo_dir/bin/codex" "$@")
    if [[ "$actual" != "$expected" ]]; then
        printf 'Unexpected argv\nExpected:\n%s\nActual:\n%s\n' "$expected" "$actual" >&2
        exit 1
    fi
}

check_args ''
check_args $'resume\n--last' resume --last
check_args $'exec\na\\ b\n--\n--disable\ncomputer_use' exec 'a b' -- --disable computer_use
# Outside cmux, retain an explicit user disable.
check_args $'--disable\ncomputer_use' --disable computer_use

export CMUX_CODEX_PID=123 CMUX_SURFACE_ID=test
check_args $'--enable\nhooks\n-c\nhooks.Stop=\\[\\]\nresume\n--last' --disable computer_use --enable hooks -c 'hooks.Stop=[]' resume --last
# Remove only cmux's leading pair; preserve subsequent user options.
check_args $'--disable\ncomputer_use' --disable computer_use --disable computer_use

export CODEX_TEST_EXIT=23
set +e
bash "$repo_dir/bin/codex" >/dev/null
result=$?
set -e
[[ $result == 23 ]]
printf 'Passed: 6 argv checks and exit-code propagation\n'
