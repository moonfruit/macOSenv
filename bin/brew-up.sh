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

KNOWN_BOTTLED=(
    moonfruit/tap/wlp-webprofile8
    oven-sh/bun/bun
)

find-bottled() {
    local result=()
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

readarray -t OUTDATED < <(brew outdated)
if ((${#OUTDATED[@]})); then
    cleanup "${OUTDATED[@]}"

    if BOTTLED=$(find-bottled "${OUTDATED[@]}"); then
        brew upgrade --display-times "${BOTTLED[@]}"
    fi

    if brew upgrade --force-bottle --display-times; then
        brew autoremove
        echo "$GREEN==>$RESET ${BOLD}Cleaning Homebrew$RESET"
        brew cleanup
    fi
fi

OUTPUT=$(brew-outdated.py)
if [[ $OUTPUT ]]; then
    echo "$GREEN==>$RESET ${BOLD}Outdated casks$RESET"
    echo "$OUTPUT"
    echo "$GREEN==>$RESET ${BOLD}Upgrade casks$RESET"
    readarray -t OUTDATED < <(echo "$OUTPUT" | awk 'NR>2{print $2}')
    for CASK in "${OUTDATED[@]}"; do
        echo "brew ${BOLD}upgrade$RESET --cask $BLUE$CASK$RESET"
    done
    cleanup "${OUTDATED[@]}"
fi
