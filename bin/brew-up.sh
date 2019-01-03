#!/bin/bash

if [[ -z "$PROXY_ENABLED" ]] && proxy >/dev/null 2>&1; then
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
if [[ -z $OUTDATED ]]; then
	exit 0
fi

if brew upgrade; then
	echo "$GREEN==>$RESET ${BOLD}Cleanup Homebrew$RESET"
	brew cleanup -s
fi
