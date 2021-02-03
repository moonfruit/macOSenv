#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy >/dev/null 2>&1; then
	exec proxy "$0" "$@"
fi

BLUE=$(tput setaf 4)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

brew livecheck --json --installed | \
	jq -r '.[] | select(.version.outdated) |
		"\(if has("formula") then .formula else .cask end)\t\(.version.current)\t\(.version.latest)"' | \
	while IFS=$'\t' read -r -a ITEMS; do
		echo "$BLUE${ITEMS[0]}$RESET : ${ITEMS[1]} ==> $GREEN${ITEMS[2]}$RESET"
	done
