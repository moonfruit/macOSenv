#!/bin/bash
# https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh

NAME=$(basename "$0")
TMP=/tmp/$NAME.$$

mkdir -p "$TMP"
cd "$TMP" || exit 1

copy() {
    DEST="$2/$(basename "$1")"
    if ! diff "$1" "$DEST"; then
        cp "$1" "$DEST"
    fi
}

wget https://iterm2.com/shell_integration/zsh -O item.zsh
copy item.zsh "$ENV/etc/zsh"

UTILS=(imgcat imgls it2api it2attention it2check it2copy it2dl it2getvar it2git it2setcolor it2setkeylabel it2ul it2universion)
for UTIL in "${UTILS[@]}"; do
    wget "https://iterm2.com/utilities/$UTIL"
	BANG=$(head -1 "$UTIL")
	if [[ $BANG == *python* ]]; then
		sed -i '1s|.*|#!/usr/bin/env python|' "$1"
		copy "$UTIL" "$ENV/package/iterm2"
	else
    	copy "$UTIL" "$ENV/bin"
	fi
done

rm -fr "$TMP"
