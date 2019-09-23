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
brew update $PREINSTALL -v
export HOMEBREW_AUTO_UPDATE_CHECKED=1

OUTDATED=$(brew outdated)
if [[ -n $OUTDATED ]]; then
	if brew upgrade --force-bottle; then
		echo "$GREEN==>$RESET ${BOLD}Cleaning Homebrew$RESET"
		brew cleanup -s --prune 30
	fi
fi

OUTDATED=$(brew cask outdated)
if [[ -n $OUTDATED ]]; then
	echo "$GREEN==>$RESET ${BOLD}Outdated casks$RESET"
	echo "$OUTDATED"
fi
