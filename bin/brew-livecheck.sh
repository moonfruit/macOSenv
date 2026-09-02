#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy >/dev/null 2>&1; then
    exec proxy "$0" "$@"
fi

# 禁止 livecheck 期间自动更新 Homebrew 的 tap（git 仓库）。
# 它同时让 Homebrew::API.fetch_api_files! 把 stale_seconds 置为 nil，
# 于是 skip_download? 对任何已存在且非空的 *.jws.json 都直接返回 true —— 即
# 缓存只要在，就绝不会被并发子进程重新下载。参见 warm-api-cache。
export HOMEBREW_NO_AUTO_UPDATE=1

# shellcheck disable=SC2155
readonly GREEN=$(tput setaf 2) BLUE=$(tput setaf 4)
# shellcheck disable=SC2155
readonly BOLD=$(tput bold) RESET=$(tput sgr0)

# 固定全量检查的 tap：里面的 formula 和 cask 不论是否安装都要查，
# 条目随 tap 内容自动增减，不必在 EXTRA 里手工登记。
readonly TAPS=(
    moonfruit/tap
)

# TAPS 之外、没装但仍想跟踪的包。
readonly EXTRA=(
    kettle
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
    jetbrains-gateway
    mps
    phpstorm
    pycharm
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

# livecheck 的 --full-name 只对第三方 tap 给出全名，homebrew/core 与 homebrew/cask
# 仍然输出短名 —— key 按同样规则生成，排除项才能精确到 tap：否则
# moonfruit/tap/cxpatcher 会被 italomandara 那个同名 cask 连坐排除掉。
as-json-keys() {
    local it
    for it in "$@"; do
        case $it in
        homebrew/*) echo "\"${it##*/}\":true" ;;
        *) echo "\"$it\":true" ;;
        esac
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

# 传进来的包里尚未安装的那些，输出全名。前导的 - 开头参数原样交给 brew info
# （用 --formula / --cask 限定类型）；一个包名都没有时直接返回 —— 否则
# brew info 会退化成「列出该类型的全部包」。
uninstalled() {
    local -a options
    while [[ $1 == -* ]]; do
        options+=("$1")
        shift
    done
    [[ $# -gt 0 ]] || return 0

    brew info --json=v2 "${options[@]}" "$@" | jq -r '
        [.formulae[] | select(.installed | length == 0) | "\(.tap)/\(.name)"] +
        [.casks[] | select(.installed | not) | "\(.tap)/\(.token)"] |
        .[]'
}

# EXTRA 与 TAPS 中尚未安装的部分。已安装的由 brew-ls 的 --installed 那半边覆盖，
# 这里滤掉以免同一个包被检查两次；末尾去重是防 EXTRA 与 TAPS 写重。
#
# formula 与 cask 分三次查而不是并成一次：brew info 按短名去重，把 macast 和
# moonfruit/tap/macast 当成同一个，后者会被静默吞掉。
brew-extra() {
    local tap_json
    tap_json=$(brew tap-info --json "${TAPS[@]}")

    local -a formulae casks
    readarray -t formulae < <(jq -r '.[].formula_names[]' <<<"$tap_json")
    readarray -t casks < <(jq -r '.[].cask_tokens[]' <<<"$tap_json")

    {
        uninstalled "${EXTRA[@]}"
        uninstalled --formula "${formulae[@]}"
        uninstalled --cask "${casks[@]}"
    } | awk '!seen[$0]++'
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

readonly LIVECHECK=(brew livecheck --json --full-name --extract-plist)

# 在 fan-out 之前把 API JSON 缓存拉齐。
#
# Homebrew 下载这些文件时用 `curl --output <目标路径>` 直写，没有临时文件+rename，
# 并且解析失败会 unlink 目标再重试（Library/Homebrew/api.rb）。因此只要文件缺失，
# N 个并发子进程就会同时把 18M 的 cask.jws.json 写进同一路径、互相截断，各自解析
# 失败后又各自删文件重下，陷入 "Cannot download non-corrupt ..." 的雪崩且无法自愈。
#
# 串行阶段的 brew info（brew-ls / brew-extra）走的是 internal packages API，
# 根本不触碰 cask.jws.json —— 它第一次被需要就是在并发的 cask livecheck 里，
# 所以 fan-out 跑到第一批 cask 时必然踩中。这里显式串行预热，把窗口彻底关掉。
warm-api-cache() {
    brew ruby -e '
        Homebrew::API::Formula.fetch_api!
        Homebrew::API::Formula.fetch_tap_migrations!
        Homebrew::API::Cask.fetch_api!
        Homebrew::API::Cask.fetch_tap_migrations!
    '
}

echo "$GREEN==>$RESET ${BOLD}Live Check$RESET"
if [[ $1 == --parallel ]]; then
    # 预热必须成功：缓存不齐就进 fan-out 只会雪崩，不如直接失败。
    if ! warm-api-cache; then
        echo "$GREEN==>$RESET ${BOLD}预热 Homebrew API 缓存失败，中止$RESET" >&2
        exit 1
    fi

    # 待检查列表也在 fan-out 之前串行取完。
    mapfile -t TARGETS < <(brew-ls | not-autobump)

    add-to-outdated < <("${LIVECHECK[@]}" git)
    add-to-outdated < <(printf '%s\n' "${TARGETS[@]}" |
        parallel -n8 --bar "${LIVECHECK[@]}" | exclude-skipped)
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

if hash it2check 2>/dev/null && it2check; then
    it2attention start
fi
