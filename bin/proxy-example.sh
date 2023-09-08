#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy 2>/dev/null; then
	exec proxy "$0" "$@"
fi

echo "$0" "$@"
env | rg -i proxy
