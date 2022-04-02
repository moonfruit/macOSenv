#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy >/dev/null 2>&1; then
	exec proxy "$0" "$@"
fi

BOLD=$(tput bold)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

EXTRA=(
	ccache

	ant
	ant@1.9
	kettle
	plantuml
	tomcat
	tomcat@9
	tomcat@8
	wildfly-as

	alacritty
	ariang
	dbvisualizer
	discord
	kitty
	macast
	oracle-jdk
	semeru-jdk11-open
	slack
	slack-beta
	paw
	postman
	samsung-portable-ssd-t5

	appcode
	android-studio
	clion
	datagrip
	dataspell
	goland
	intellij-idea
	jetbrains-toolbox
	phpstorm
	pycharm
	rider
	rubymine
	webstorm
)

NOPROXY=(
	adrive
	baidunetdisk
	neteasemusic
	tencent-lemon
	tencent-meeting
	thunder
	uu-booster
	wechat
	wechatwork
	ximalaya
)

OUTDATED=()

iterate() {
	COMMAND=$1
	shift

	while [[ $# -gt 0 ]]; do
		IFS=";" read -r -a ARGUMENTS <<<$1
		"$COMMAND" "${ARGUMENTS[@]}"
		shift
	done
}

bump() {
	# shellcheck disable=SC2076
	if [[ " ${NOPROXY[*]} " =~ " $2 " ]]; then
		PREFIX="${RED}noproxy$RESET "
	else
		PREFIX=""
	fi
	echo "${PREFIX}brew ${BOLD}bump-$1-pr$RESET --version $GREEN$4$RESET $BLUE$2$RESET"
}

describe() {
	echo "$BLUE$2$RESET : $3 ==> $GREEN$4$RESET"
}

handle-outdated() {
	mapfile -t OUTPUT < <(jq -r '.[] | select(.version.outdated) |
		"\(if has("formula") then "formula;" + .formula else "cask;" + .cask end);\(.version.current);\(.version.latest)"')
	OUTDATED+=("${OUTPUT[@]}")
	iterate describe "${OUTPUT[@]}"
}

brew-extra() {
	brew info --json=v2 "${EXTRA[@]}" | jq -r '.formulae + .casks | .[] |
		select(.installed | length == 0) |
		"\(.tap)/\(if has("token") then .token else .name end)"'
}

brew-ls() {
	brew info --json=v2 --installed | jq -r '.formulae + .casks | .[] |
		"\(.tap)/\(if has("token") then .token else .name end)"'
	brew-extra
}

echo "$GREEN==>$RESET ${BOLD}Live Check$RESET"
if [[ $1 == --parallel ]]; then
	handle-outdated < <(brew-ls | parallel -n8 --bar brew livecheck --json)
else
	handle-outdated < <(brew livecheck --json --installed)
	echo "$GREEN==>$RESET ${BOLD}Live Check (Extra)$RESET"
	handle-outdated < <(brew-extra | xargs brew livecheck --json)
fi

if [[ ${#OUTDATED[@]} -gt 0 ]]; then
	echo "$GREEN==>$RESET ${BOLD}Bump PR$RESET"
	iterate bump "${OUTDATED[@]}"
fi

it2attention start
