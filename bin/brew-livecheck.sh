#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy >/dev/null 2>&1; then
	exec proxy "$0" "$@"
fi

BOLD=$(tput bold)
BLUE=$(tput setaf 4)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

output() {
	jq -r '.[] | select(.version.outdated) |
		"\(if has("formula") then .formula else .cask end)\t\(.version.current)\t\(.version.latest)"' | \
	while IFS=$'\t' read -r -a ITEMS; do
		echo "$BLUE${ITEMS[0]}$RESET : ${ITEMS[1]} ==> $GREEN${ITEMS[2]}$RESET"
	done
}

echo "$GREEN==>$RESET ${BOLD}Live Check$RESET"
if [[ $1 == --parallel ]]; then
	(brew ls --formula | sed 's/^/--formula,/'; brew ls --cask | sed 's/^/--cask,/') | \
		parallel -C, -j16 --bar brew livecheck --json '{1}' '{2}' | output
else
	brew livecheck --json --installed | output
fi

it2attention start
