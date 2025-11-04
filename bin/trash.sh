#!/usr/bin/env bash

(($#)) || exit

FILES=()
for FILE in "$@"; do
	FILES+=("$(realpath "$FILE")")
done

SCRIPT=$(realpath "${BASH_SOURCE[0]}/../trash.scpt")
osascript "$SCRIPT" "${FILES[@]}" >/dev/null
