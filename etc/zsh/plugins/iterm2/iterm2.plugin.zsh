if [[ $TERM_PROGRAM == iTerm.app ]]; then
    BIN=${0:A:h}/bin
    if [[ -f "$BIN/iterm2.zsh" ]]; then
        export PATH="$BIN:$PATH"
        source $BIN/iterm2.zsh
    fi
fi
