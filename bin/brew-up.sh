#!/usr/bin/env bash

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

PREFIX=$(brew --prefix)
pull() {
	local tap="$PREFIX/Library/Taps/$1"
	if [[ $(git -C "$tap" branch --show-current) = "master" ]]; then
		echo "$GREEN==>$RESET ${BOLD}Pull $1$RESET"
		git -C "$tap" merge --ff-only origin/master
	fi
}
pull homebrew/homebrew-core
pull homebrew/homebrew-cask

brew-info() {
	if (($# > 0)); then
		brew info --json=v2 "$@"
	else
		xargs brew info --json=v2
	fi
}

cleanup() {
	readarray -t NOCHECK < <(
		brew-info "$@" | jq -r '.casks[] | select(.sha256 == "no_check") | .full_token'
	)
	if [[ ${#NOCHECK[@]} -gt 0 ]]; then
		echo "$GREEN==>$RESET ${BOLD}Cleaning casks: ${NOCHECK[*]} $RESET"
		brew cleanup --prune=all "${NOCHECK[@]}"
	fi
}

OUTDATED=$(brew outdated)
if [[ $OUTDATED ]]; then
	echo "$OUTDATED" | choose 0 | cleanup
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
	readarray -t CASKS < <(echo "$OUTDATED" | awk 'NR>2{print $2}')
	for CASK in "${CASKS[@]}"; do
		echo "brew ${BOLD}upgrade$RESET --cask $BLUE$CASK$RESET"
	done
	cleanup "${CASKS[@]}"
fi
