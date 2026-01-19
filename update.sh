#!/usr/bin/env bash

set -euo pipefail

BREW=1
GC=

OPTS=$(getopt -n "$0" -o bg -l gc,no-gc,brew,no-brew -- "$@")
eval set -- "$OPTS"
while true; do
    case "$1" in
    -g | --gc)
        GC=1
        shift
        ;;
    --no-gc)
        GC=
        shift
        ;;
    -b | --brew)
        BREW=1
        shift
        ;;
    --no-brew)
        BREW=
        shift
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "Internal error!"
        exit 1
        ;;
    esac
done

rg submodule .gitmodules | sed 's/.*"\(.*\)".*/\1/' | sort |
    while read -r MODULE; do
        echo "-------- $MODULE --------"
        git -C "$MODULE" checkout master
        git -C "$MODULE" fetch --tags --prune --no-tags origin master
        git -C "$MODULE" rebase origin/master
        if [[ -n $GC ]]; then
            git -C "$MODULE" gc
        fi
    done

fd -tf update.sh | while read -r MODULE; do
    if [[ $MODULE == update.sh ]]; then
        continue
    fi
    DIR=${MODULE%/*}
    echo "-------- $DIR --------"
    (cd "$DIR" && ./update.sh)
done

if [[ -n $BREW ]]; then
    echo "-------- homebrew --------"
    brew-up.sh
    brew-livecheck.sh --parallel
fi
