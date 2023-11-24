#!/bin/bash
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

wget https://iterm2.com/shell_integration/zsh -O iterm2.zsh
copy-if-diff iterm2.zsh "$BIN"

wget https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh -O utilities.sh
eval "$(rg '^UTILITIES=' utilities.sh)"

for UTILITY in "${UTILITIES[@]}"; do
    wget "https://iterm2.com/utilities/$UTILITY"
    BANG=$(head -1 "$UTILITY")
    if [[ $BANG == *python* ]]; then
        sed -i '1s|.*|#!'"$PYTHON"'|' "$UTILITY"
    fi
    copy-if-diff "$UTILITY" "$BIN" chmod +x
done
