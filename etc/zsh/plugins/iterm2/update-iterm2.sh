#!/bin/bash
# https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh

BIN=$PWD/bin
mkdir -p "$BIN"

PYTHON=$PWD/venv/bin/python
if [[ ! -x "$PYTHON" ]]; then
	echo "'$PYTHON' does not exist or cannot be executed"
	exit 1
fi

TEMP=$(mktemp -d -t "$(basename "$0")")
mkdir -p "$TEMP"
on-exit() {
	rm -fr "$TEMP"
}
trap on-exit EXIT
cd "$TEMP" || exit 1

copy() {
	DEST="$2/$(basename "$1")"
	if ! diff "$DEST" "$1"; then
		cp "$1" "$DEST"
		if [[ -n $3 ]]; then
			chmod "$3" "$DEST"
		fi
	fi
}

wget https://iterm2.com/shell_integration/zsh -O iterm2.zsh
copy iterm2.zsh "$BIN"

UTILITIES=(
	imgcat imgls it2api it2attention it2check it2copy it2dl it2getvar
	it2setcolor it2setkeylabel it2tip it2ul it2universion it2profile
)
for UTILITY in "${UTILITIES[@]}"; do
	wget "https://iterm2.com/utilities/$UTILITY"
	BANG=$(head -1 "$UTILITY")
	if [[ $BANG == *python* ]]; then
		sed -i '1s|.*|#!'"$PYTHON"'|' "$UTILITY"
	fi
	copy "$UTILITY" "$BIN" "+x"
done
