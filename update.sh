#!/bin/bash

rg submodule .gitmodules | sed 's/.*"\(.*\)".*/\1/' | sort |
    while read -r MODULE; do
        echo "-------- $MODULE --------"
        git -C "$MODULE" checkout master
        git -C "$MODULE" pull
        if [[ $1 == gc ]]; then
            "$GIT" -C "$MODULE" gc
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
