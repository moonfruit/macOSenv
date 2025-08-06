#!/bin/bash

rg submodule .gitmodules | sed 's/.*"\(.*\)".*/\1/' | sort |
    while read -r MODULE; do
        echo "-------- $MODULE --------"
        git -C "$MODULE" checkout master
        git -C "$MODULE" fetch --tags --prune --no-tags origin master
        git -C "$MODULE" rebase origin/master
        if [[ $1 == gc ]]; then
            git -C "$MODULE" gc
        fi
    done

if [[ $1 == gc ]]; then
    exit
fi

fd -tf update.sh | while read -r MODULE; do
    if [[ $MODULE == update.sh ]]; then
        continue
    fi
    DIR=${MODULE%/*}
    echo "-------- $DIR --------"
    (cd "$DIR" && ./update.sh)
done
