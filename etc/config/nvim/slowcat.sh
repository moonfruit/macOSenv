#!/usr/bin/env bash

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: $0 [file]"
    echo "If no file is provided, it reads from standard input."
    exit 0
fi

SLEEP_DURATION=0.01
if (($#)); then
    while IFS= read -r line; do
        echo "$line"
        sleep "$SLEEP_DURATION"
    done <"$1"
else
    while IFS= read -r line; do
        echo "$line"
        sleep "$SLEEP_DURATION"
    done
fi
