#!/usr/bin/env bash

set -euo pipefail

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <json1> <json2>"
    exit 1
fi

if command -v delta &>/dev/null; then
    DIFF=(delta --paging=never)
else
    DIFF=(diff)
fi

standardize() {
    json5 "$1" | jq -S
}

exec "${DIFF[@]}" <(standardize "$1") <(standardize "$2")
