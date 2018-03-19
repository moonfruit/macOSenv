#!/bin/bash
# https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh

NAME=$(basename "$0")
TMP=/tmp/$NAME.$$

mkdir -p "$TMP"
cd "$TMP" || exit 1

wget https://iterm2.com/shell_integration/zsh -O item.zsh
if ! diff item.zsh "$ENV/etc/zsh/item.zsh"; then
    cp item.zsh "$ENV/etc/zsh/item.zsh"
fi

UTILS=(imgcat imgls it2attention it2check it2copy it2dl it2getvar it2setcolor it2setkeylabel it2ul it2universion)
for UTIL in "${UTILS[@]}"; do
    wget "https://iterm2.com/utilities/$UTIL"
    if ! diff "$UTIL" "$ENV/bin/$UTIL"; then
        cp "$UTIL" "$ENV/bin/$UTIL"
    fi
done

rm -fr "$TMP"
