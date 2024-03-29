#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy >/dev/null 2>&1; then
    exec proxy "$0" "$@"
fi

# shellcheck disable=SC2155
readonly GREEN=$(tput setaf 2) BLUE=$(tput setaf 4)
# shellcheck disable=SC2155
readonly BOLD=$(tput bold) RESET=$(tput sgr0)

readonly EXTRA=(
    kettle
    zig

    alacritty
    ariang
    c0re100-qbittorrent
    dbvisualizer
    kitty
    macast
    motrix
    oracle-jdk
    qbittorrent
    rapidapi
    semeru-jdk-open
    semeru-jdk8-open
    semeru-jdk11-open
    semeru-jdk17-open
    slack
    slack-beta

    homebrew/cask/docker
    homebrew/cask/samsung-portable-ssd-t7

    android-studio
    clion
    datagrip
    dataspell
    goland
    fleet
    intellij-idea
    intellij-idea-ce
    jetbrains-toolbox
    mps
    phpstorm
    pycharm
    pycharm-ce
    rider
    rubymine
    rustrover
    webstorm
    writerside
)

readonly EXCLUDED=(
    hazelcast
    hazelcast-management-center
    microsoft-edge
    nghttp2
    libnghttp2
    luajit
    q
    tencent-meeting
)

join-by() {
    local IFS="$1"
    shift
    echo "$*"
}

as-json-keys() {
    local it
    for it in "$@"; do
        echo "\"$it\":true"
    done
}

as-json-object() {
    local -a keys
    readarray -t keys < <(as-json-keys "$@")
    printf "{%s}" "$(join-by ',' "${keys[@]}")"
}

# shellcheck disable=SC2155
readonly EXCLUDED_JSON=$(as-json-object "${EXCLUDED[@]}")

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

handle-outdated() {
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

readonly HOMEBREW_CORE="/opt/homebrew/Library/Taps/homebrew/homebrew-core"
readonly HOMEBREW_CASK="/opt/homebrew/Library/Taps/homebrew/homebrew-cask"
autobump-patterns() {
    sed 's|^|homebrew/core/|' $HOMEBREW_CORE/.github/autobump.txt
    sed 's|^|homebrew/cask/|' $HOMEBREW_CASK/.github/autobump.txt
}

not-autobump() {
    rg -Fxvf <(autobump-patterns)
}

echo "$GREEN==>$RESET ${BOLD}Live Check$RESET"
if [[ $1 == --parallel ]]; then
    handle-outdated < <(brew-ls | not-autobump | parallel -n8 --bar brew livecheck --json)
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
