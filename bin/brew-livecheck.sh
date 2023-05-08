#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy >/dev/null 2>&1; then
	exec proxy "$0" "$@"
fi

BOLD=$(tput bold)
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
	motrix
	oracle-jdk
	postman
	rapidapi
	samsung-portable-ssd-t7
	semeru-jdk-open
	semeru-jdk8-open
	semeru-jdk11-open
	semeru-jdk17-open
	slack
	slack-beta
	warp

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

EXCLUDED=(
	luajit
	hazelcast
	hazelcast-management-center
)

OUTDATED=()

iterate() {
	COMMAND=$1
	shift

	while [[ $# -gt 0 ]]; do
		IFS=";" read -r -a ARGUMENTS <<<"$1"
		"$COMMAND" "${ARGUMENTS[@]}"
		shift
	done
}

bump() {
	echo "${PREFIX}brew ${BOLD}bump-$1-pr$RESET --version $GREEN$4$RESET $BLUE$2$RESET"
}

describe() {
	echo "$BLUE$2$RESET : $3 ==> $GREEN$4$RESET"
}

generate-excluded() {
	if [[ -z $EXCLUDED_JSON ]]; then
		EXCLUDED_JSON="{"
		for ITEM in "${EXCLUDED[@]}"; do
			if [[ -n $COMMA ]]; then
				EXCLUDED_JSON+=$COMMA
			else
				COMMA=,
			fi
			EXCLUDED_JSON+="\"$ITEM\":true"
		done
		EXCLUDED_JSON+="}"
	fi
}

handle-outdated() {
	generate-excluded
	mapfile -t OUTPUT < <(jq -r --argjson excluded "$EXCLUDED_JSON" '.[] |
		select(.version.outdated) | {
			type: "\(if .formula then "formula" else "cask" end)",
			name: "\(if .formula then .formula else .cask end)",
			version: .version
		} |
		select(.name | in($excluded) | not) |
		"\(.type);\(.name);\(.version.current);\(.version.latest)"')
	OUTDATED+=("${OUTPUT[@]}")
	iterate describe "${OUTPUT[@]}"
}

brew-extra() {
	brew info --json=v2 "${EXTRA[@]}" | jq -r '.formulae + .casks | .[] |
		select(.installed | length == 0) |
		"\(if .tap == null then "homebrew/cask" else .tap end)/\(if has("token") then .token else .name end)"'
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
