#!/usr/bin/env bash

if ! hash kubectl 2>/dev/null; then
    return
fi

source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

DIR=$(main-script-directory)
create-temp-directory TEMP
if [[ -n "$TEMP" ]]; then
    kubectl completion zsh >"$TEMP/_kubectl"
    copy-if-diff "$TEMP/_kubectl" "$DIR"
fi
