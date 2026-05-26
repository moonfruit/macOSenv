#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy 2>/dev/null; then
    exec proxy "$0" "$@"
fi

source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/github.sh"

h1 Updating ariang
download-latest-release ariang mayswind AriaNg 'endswith("-AllInOne.zip")'
echo

h1 Updating gost-ui
download-branch gost go-gost gost-ui gh-pages
echo
