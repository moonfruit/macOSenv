if [[ $LC_TERMINAL == iTerm2 ]]; then
    export PATH="${0:A:h}/bin:$PATH"
    source ${0:A:h}/bin/iterm2.zsh
fi
