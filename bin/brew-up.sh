#!/bin/bash

BOLD=$(tput bold)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

echo "$GREEN==>$RESET ${BOLD}Updating Homebrew$RESET"
proxy brew update -v

OUTDATED=$(brew outdated)
if [[ -z $OUTDATED ]]; then
	exit 0
fi

if proxy brew upgrade; then
	echo "$GREEN==>$RESET ${BOLD}Cleanup Homebrew$RESET"
	brew cleanup -s
fi
