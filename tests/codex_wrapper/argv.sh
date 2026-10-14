#!/usr/bin/env bash
if (( $# > 0 )); then
    printf '%q\n' "$@"
fi
exit "${CODEX_TEST_EXIT:-0}"
