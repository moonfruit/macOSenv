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
    discord
    kitty
    macast
    motrix
    oracle-jdk
    oracle-jdk@17
    oracle-jdk@21
    qbittorrent
    rapidapi
    semeru-jdk-open
    semeru-jdk-open@8
    semeru-jdk-open@11
    semeru-jdk-open@17
    semeru-jdk-open@21
    slack
    wezterm
    zulu
    zulu@8
    zulu@11
    zulu@17
    zulu@21

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
    harelba/q/q
    hazelcast/hz/hazelcast
    hazelcast/hz/hazelcast-management-center
    homebrew/cask/microsoft-edge
    homebrew/cask/tencent-meeting
    homebrew/core/luajit
    homebrew/core/nghttp2
    homebrew/core/libnghttp2
    homebrew/core/redis
)

join-by() {
    local IFS="$1"
    shift
    echo "$*"
}

as-json-keys() {
    local it
    for it in "$@"; do
        echo "\"${it##*/}\":true"
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
    for it in "${EXCLUDED[@]}"; do
        echo "$it"
    done
    sed 's|^|homebrew/core/|' $HOMEBREW_CORE/.github/autobump.txt
    sed 's|^|homebrew/cask/|' $HOMEBREW_CASK/.github/autobump.txt
}

not-autobump() {
    rg -Fxvf <(autobump-patterns)
}

exclude-skipped() {
    rg -v ': skipped - '
}

readonly LIVECHECK=(brew livecheck --json --extract-plist)

echo "$GREEN==>$RESET ${BOLD}Live Check$RESET"
if [[ $1 == --parallel ]]; then
    handle-outdated < <(brew-ls | not-autobump | parallel -n8 --bar "${LIVECHECK[@]}" | exclude-skipped)
else
    handle-outdated < <("${LIVECHECK[@]}" --installed | exclude-skipped)
    echo "$GREEN==>$RESET ${BOLD}Live Check (Extra)$RESET"
    handle-outdated < <(brew-extra | xargs "${LIVECHECK[@]}" | exclude-skipped)
fi

if [[ ${#OUTDATED[@]} -gt 0 ]]; then
    echo "$GREEN==>$RESET ${BOLD}Bump PR$RESET"
    iterate bump "${OUTDATED[@]}"
fi

it2attention start
