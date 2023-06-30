if [[ $LC_TERMINAL == iTerm2 ]]; then
    BIN=${0:A:h}/bin
    if [[ -f "$BIN/iterm2.zsh" ]]; then
        export PATH="$BIN:$PATH"
        source $BIN/iterm2.zsh
    fi
fi
