#!/usr/bin/env bash

BIN="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
PYTHON="$BIN/venv/bin/python"

UTILITIES="/Applications/iTerm.app/Contents/Resources/utilities"
CMD="$(basename "$0")"

exec "$PYTHON" "$UTILITIES/$CMD" "$@"
