#!/bin/bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy >/dev/null 2>&1; then
	exec proxy "$0" "$@"
fi

BOLD=$(tput bold)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

PREINSTALL=--preinstall
if [[ $1 = "--force" || $1 = "-f" ]]; then
	PREINSTALL=
fi

echo "$GREEN==>$RESET ${BOLD}Updating Homebrew$RESET"
# shellcheck disable=SC2086
brew update $PREINSTALL -v
export HOMEBREW_UPDATE_PREINSTALL=1

OUTDATED=$(brew outdated)
if [[ -n $OUTDATED ]]; then
	if brew upgrade --force-bottle --display-times; then
		brew autoremove
		echo "$GREEN==>$RESET ${BOLD}Cleaning Homebrew$RESET"
		brew cleanup -s
	fi
fi

echo "$GREEN==>$RESET ${BOLD}Outdated casks$RESET"
brew-outdated.py
