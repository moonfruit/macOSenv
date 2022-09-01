#!/bin/bash
# https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh

NAME=$(basename "$0")
TMP=/tmp/$NAME.$$

mkdir -p "$TMP"
cd "$TMP" || exit 1

copy() {
	DEST="$2/$(basename "$1")"
	if ! diff "$DEST" "$1"; then
		cp "$1" "$DEST"
	fi
}

wget https://iterm2.com/shell_integration/zsh -O item.zsh
copy item.zsh "$ENV/etc/zsh"

UTILITIES=(imgcat imgls it2api it2attention it2check it2copy it2dl it2getvar it2git it2setcolor it2setkeylabel it2tip it2ul it2universion it2profile)
for UTILITY in "${UTILITIES[@]}"; do
	wget "https://iterm2.com/utilities/$UTILITY"
	BANG=$(head -1 "$UTILITY")
	if [[ $BANG == *python* ]]; then
		sed -i '1s|.*|#!/usr/bin/env python|' "$UTILITY"
		copy "$UTILITY" "$ENV/package/iterm2"
	else
		copy "$UTILITY" "$ENV/bin"
	fi
done

rm -fr "$TMP"
