#!/usr/bin/env bash
source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

DIR=$(main-script-directory)

BIN=$DIR/bin
mkdir -p "$BIN"

PYTHON=$DIR/venv/bin/python
if [[ ! -x "$PYTHON" ]]; then
    echo "'$PYTHON' does not exist or cannot be executed"
    exit 1
fi

create-temp-directory TEMP_DIR
cd "$TEMP_DIR" || exit 1

eval "$(curl https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | rg '^UTILITIES=')"

cp -p "$BIN"/* .
mv iterm2.zsh zsh

echo
wget -N https://iterm2.com/shell_integration/zsh "${UTILITIES[@]/#/https://iterm2.com/utilities/}"
copy-if-diff zsh "$BIN/iterm2.zsh"

for UTILITY in "${UTILITIES[@]}"; do
    SHEBANG=$(head -1 "$UTILITY")
    if [[ $SHEBANG == *python* ]]; then
        sed -i '1s|.*|#!'"$PYTHON"'|' "$UTILITY"
    fi
    copy-if-diff "$UTILITY" "$BIN" chmod +x
done
