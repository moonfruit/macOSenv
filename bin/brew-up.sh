#!/bin/bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy >/dev/null 2>&1; then
	exec proxy "$0" "$@"
fi

STATUS=$(curl -sw "%{http_code}" http://connectivitycheck.gstatic.com/generate_204)
if [[ $STATUS != 204 ]]; then
	echo Cannot connect to Internet
	exit 1
fi

BOLD=$(tput bold)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

PREINSTALL=--preinstall
if [[ $1 = "--force" || $1 = "-f" ]]; then
	PREINSTALL=
fi

echo "$GREEN==>$RESET ${BOLD}Updating Homebrew$RESET"
# shellcheck disable=SC2086
brew update $PREINSTALL -v
export HOMEBREW_UPDATE_PREINSTALL=1

pull() {
	local tap="/opt/homebrew/Library/Taps/$1"
	if [[ $(git -C "$tap" branch --show-current) = "master" ]]; then
		echo "$GREEN==>$RESET ${BOLD}Pull $1$RESET"
		git -C "$tap" merge --ff-only origin/master
	fi
}
pull homebrew/homebrew-core
pull homebrew/homebrew-cask

OUTDATED=$(brew outdated)
if [[ $OUTDATED ]]; then
	if brew upgrade --force-bottle --display-times; then
		brew autoremove
		echo "$GREEN==>$RESET ${BOLD}Cleaning Homebrew$RESET"
		brew cleanup
	fi
fi

OUTDATED=$(brew-outdated.py)
if [[ $OUTDATED ]]; then
	echo "$GREEN==>$RESET ${BOLD}Outdated casks$RESET"
	echo "$OUTDATED"
	echo "$GREEN==>$RESET ${BOLD}Upgrade casks$RESET"
	awk 'NR>2{print $2}' <<<"$OUTDATED" | while read -r CASK; do
		echo "brew ${BOLD}upgrade$RESET --cask $BLUE$CASK$RESET"
	done
fi
