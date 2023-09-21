#!/bin/bash

PREFIX=()
if [[ -z "$DARK_ENABLED" ]] && hash dark 2>/dev/null; then
	PREFIX+=(dark)
fi
if [[ -z "$PROXY_ENABLED" ]] && hash proxy 2>/dev/null; then
	PREFIX+=(proxy)
fi

if ((${#PREFIX[@]})); then
	exec "${PREFIX[@]}" "$0" "$@"
fi

orb sudo apt update && orb sudo apt upgrade --autoremove --yes
