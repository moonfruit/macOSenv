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

echo "$GREEN==>$RESET ${BOLD}Updating Homebrew$RESET"
# shellcheck disable=SC2086
brew update -v

PREFIX=$(brew --prefix)
pull() {
    local tap="$PREFIX/Library/Taps/$1"
    if [[ $(git -C "$tap" branch --show-current) = "main" ]]; then
        echo "$GREEN==>$RESET ${BOLD}Pull $1$RESET"
        git -C "$tap" pull --ff-only
    fi
}
pull moonfruit/homebrew-tap

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

KNOWN_BOTTLED=(
    hashicorp/tap/consul
    hazelcast/hz/hazelcast
    hazelcast/hz/hazelcast-management-center
    mongodb/brew/mongodb-community
    moonfruit/tap/wlp-webprofile8
    moonfruit/tap/wlp-webprofile10
    moonfruit/tap/wlp-webprofile11
    oven-sh/bun/bun
)

find-bottled() {
    local result=()
    local item
    for item in "$@"; do
        for i in "${!KNOWN_BOTTLED[@]}"; do
            if [[ "$item" == "${KNOWN_BOTTLED[i]}" ]]; then
                result+=("$item")
                unset 'KNOWN_BOTTLED[i]' # 删除已匹配元素，避免重复匹配
                break
            fi
        done
    done
    if ((${#result[@]})); then
        echo "${result[@]}"
    else
        return 1
    fi
}

cleanup-fonts() {
    FIND_FONTS=(fd -tf -e otf -e ttc -e ttf -e woff -e woff2 . "$(brew --caskroom)/font-"*)
    if "${FIND_FONTS[@]}" -q; then
        echo "$GREEN==>$RESET ${BOLD}Cleaning Homebrew Fonts$RESET"
        "${FIND_FONTS[@]}" | while read -r FONT; do
            echo "Removing font file: $FONT"
            rm "$FONT"
        done
    fi
}

readonly CASKS=(
    firefox
    intellij-idea
    iterm2@beta
    visual-studio-code
    wechat
)

upgrade-cask() {
    local left=()
    local item
    for item in "$@"; do
        local cask
        for cask in "${CASKS[@]}"; do
            if [[ $item == "$cask" ]]; then
                echo "brew ${BOLD}upgrade$RESET --cask $BLUE${item}$RESET"
                continue 2
            fi
        done
        left+=("$item")
    done
    if ((${#left[@]})); then
        echo "brew ${BOLD}upgrade$RESET --cask $BLUE${left[*]}$RESET"
    fi
}

readarray -t OUTDATED < <(brew outdated)
if ((${#OUTDATED[@]})); then
    cleanup "${OUTDATED[@]}"

    if BOTTLED=$(find-bottled "${OUTDATED[@]}"); then
        # shellcheck disable=SC2086
        brew upgrade --display-times $BOTTLED
    fi

    if brew upgrade --force-bottle --display-times; then
        brew autoremove
        echo "$GREEN==>$RESET ${BOLD}Cleaning Homebrew$RESET"
        brew cleanup
    fi
fi

cleanup-fonts

OUTPUT=$(brew-outdated.py)
if [[ $OUTPUT ]]; then
    echo "$GREEN==>$RESET ${BOLD}Outdated casks$RESET"
    echo "$OUTPUT"
    echo "$GREEN==>$RESET ${BOLD}Upgrade casks$RESET"
    readarray -t OUTDATED < <(echo "$OUTPUT" | awk 'NR>2{print $2}')

    upgrade-cask "${OUTDATED[@]}"
    cleanup --cask "${OUTDATED[@]}"
fi
