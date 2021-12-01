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

EXTRA=(
	ccache
	neovim
	vim

	ant
	ant@1.9
	kettle
	openj9
	openliberty-webprofile8
	plantuml
	tomcat
	tomcat@9
	tomcat@8
	wildfly-as

	ariang
	discord
	kitty
	oracle-jdk
	samsung-portable-ssd-t5

	appcode
	android-studio
	clion
	datagrip
	goland
	intellij-idea
	phpstorm
	pycharm
	rider
	rubymine
	webstorm
)

brew-ls() {
	brew info --json=v2 --installed | jq -r '.formulae + .casks | .[] |
		if has("token") then "--cask,\(.token)" else "--formula,\(.name)" end'
	brew info --json=v2 "${EXTRA[@]}" | jq -r '.formulae + .casks | .[] |
		select(.installed | length == 0) |
		if has("token") then "--cask,\(.token)" else "--formula,\(.name)" end'
}

brew-extra() {
	brew info --json=v2 "${EXTRA[@]}" | jq -r '.formulae + .casks | .[] |
		select(.installed | length == 0) |
		if has("token") then .token else .name end'
}

echo "$GREEN==>$RESET ${BOLD}Live Check$RESET"
if [[ $1 == --parallel ]]; then
	brew-ls | parallel -C, -j8 --bar brew livecheck --json '{1}' '{2}' | output
else
	brew livecheck --json --installed | output
	echo "$GREEN==>$RESET ${BOLD}Live Check (Extra)$RESET"
	brew-extra | xargs brew livecheck --json | output
fi

it2attention start
