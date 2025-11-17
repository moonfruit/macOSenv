if [[ $TERM_PROGRAM == iTerm.app ]]; then
    source "/Applications/iTerm.app/Contents/Resources/iterm2_shell_integration.zsh"
    export PATH="${0:A:h}/bin:$PATH"
fi
