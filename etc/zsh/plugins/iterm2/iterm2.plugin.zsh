if [[ $LC_TERMINAL == iTerm2 ]]; then
    export PATH="${0:A:h}/iterm2:$PATH"
    source ${0:A:h}/iterm2/iterm2.zsh
fi
