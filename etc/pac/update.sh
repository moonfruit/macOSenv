#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy 2>/dev/null; then
	exec proxy "$0" "$@"
fi

source "$ENV/lib/bash/github.sh"

download-latest-release ariang mayswind AriaNg -AllInOne.zip
brew-analyze.sh .
