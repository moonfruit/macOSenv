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
    sing-box@2
    sing-box-ref1nd
    wlp-webprofile8
    wlp-webprofile10
    zig

    alacritty
    ariang
    c0re100-qbittorrent
    dbvisualizer
    discord
    graalvm-jdk
    graalvm-jdk@21
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
    homebrew/cask/samsung-magician

    android-studio
    clion
    datagrip
    dataspell
    fleet
    goland
    ijhttp
    intellij-idea
    intellij-idea-ce
    jetbrains-gateway
    mps
    phpstorm
    pycharm
    pycharm-ce
    rider
    rubymine
    rustrover
    webstorm
)

readonly EXCLUDED=(
    harelba/q/q
    hazelcast/hz/hazelcast
    hazelcast/hz/hazelcast-management-center
    homebrew/cask/istat-menus
    homebrew/cask/microsoft-edge
    homebrew/cask/sf-symbols
    homebrew/cask/tencent-docs
    homebrew/cask/tencent-meeting
    homebrew/core/bash
    homebrew/core/gh
    homebrew/core/git
    homebrew/core/git-svn
    homebrew/core/glab
    homebrew/core/icu4c@77
    homebrew/core/icu4c@78
    homebrew/core/libgcrypt
    homebrew/core/libgit2@1.7
    homebrew/core/libnghttp2
    homebrew/core/llvm
    homebrew/core/luajit
    homebrew/core/mas
    homebrew/core/mysql
    homebrew/core/mysql-client
    homebrew/core/netpbm
    homebrew/core/nghttp2
    homebrew/core/python@3.13
    homebrew/core/swiftlint
    italomandara/cxpatcher/cxpatcher
    oven-sh/bun/bun
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

add-to-outdated() {
    mapfile -t OUTPUT < <(jq -r --argjson excluded "$EXCLUDED_JSON" '.[] |
        select(.version.outdated) | {
            type: "\(if .formula then "formula" else "cask" end)",
            name: "\(if .formula then .formula else .cask end)",
            version: .version
        } |
        select(.name | in($excluded) | not) |
        "\(.type);\(.name);\(.version.current);\(.version.latest)"')
    OUTDATED+=("${OUTPUT[@]}")
}

brew-extra() {
    brew info --json=v2 "${EXTRA[@]}" | jq -r '
        [.formulae[] | select(.installed | length == 0) | "\(.tap)/\(.name)"] +
        [.casks[] | select(.installed | not) | "\(.tap)/\(.token)"] |
        .[]'
}

brew-ls() {
    brew info --json=v2 --installed | jq -r '
        [.formulae[] | "\(.tap)/\(.name)"] +
        [.casks[] | "\(.tap)/\(.token)"] |
        .[]'
    brew-extra
}

#autobump-patterns() {
#    echo "git"
#    for it in "${EXCLUDED[@]}"; do
#        echo "$it"
#    done
#}

not-autobump() {
    #    rg -Fxvf <(autobump-patterns)
    rg -Fxvf <(printf "%s\n" "${EXCLUDED[@]}")
}

exclude-skipped() {
    rg -v ': skipped - '
}

readonly LIVECHECK=(brew livecheck --json --extract-plist)

echo "$GREEN==>$RESET ${BOLD}Live Check$RESET"
if [[ $1 == --parallel ]]; then
    add-to-outdated < <("${LIVECHECK[@]}" git)
    add-to-outdated < <(brew-ls | not-autobump | parallel -n8 --bar "${LIVECHECK[@]}" | exclude-skipped)
else
    add-to-outdated < <("${LIVECHECK[@]}" --installed | exclude-skipped)
    echo "$GREEN==>$RESET ${BOLD}Live Check (Extra)$RESET"
    add-to-outdated < <(brew-extra | xargs "${LIVECHECK[@]}" | exclude-skipped)
fi

iterate describe "${OUTDATED[@]}"
if [[ ${#OUTDATED[@]} -gt 0 ]]; then
    echo "$GREEN==>$RESET ${BOLD}Bump PR$RESET"
    iterate bump "${OUTDATED[@]}"
fi

it2attention start
