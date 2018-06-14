#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && proxy >/dev/null 2>&1; then
	exec proxy "$0" "$@"
fi

echo "$0" "$@"
env | grep -i proxy
