#!/usr/bin/env bash

source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/fs.sh"

DIR=$(main-script-directory)

h1 Upgrade homebrew.png
create-temp-file TEMP
# shellcheck disable=SC2153
brew-analyze.py >"$TEMP"
copy-if-diff "$TEMP" "$DIR/homebrew.puml" plantuml -tsvg
