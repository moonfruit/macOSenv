#!/usr/bin/env bash
set -e

DEST=$1
if [[ -n "$DEST" ]]; then
    DEST=$(realpath "$DEST")
fi

TEMP=$(mktemp -d -t "homebrew")
mkdir -p "$TEMP"
cd "$TEMP"

brew-analyze.py >homebrew.puml
plantuml -tsvg homebrew.puml
if [[ -f homebrew.svg ]]; then
    if [[ -n "$DEST" ]]; then
        mv homebrew.svg "$DEST"
    else
        open homebrew.svg
        exit
    fi
fi

rm -r "$TEMP"
