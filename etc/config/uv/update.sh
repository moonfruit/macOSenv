#!/usr/bin/env bash
set -euo pipefail
source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/console.sh"

h1 "Updating uv tools"
if run-if-exists uv --version; then
    uv tool upgrade --all
fi
echo
