#!/bin/bash

# for GPP
export APP_HOME="$WORKSPACE/gpp"
export NODE_ID="YY"

if [[ -f "$APP_HOME/etc/bashrc" ]]; then
	NOCD=1 NOLANG=1 NOLUA=1 . "$APP_HOME/etc/bashrc"
fi

# for PATH
# USER_PYTHON_HOME="/Users/moon/Library/Python/2.7"
# export PATH="$USER_PYTHON_HOME/bin:$PATH"

PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/file-formula/bin:$PATH"
# PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="$ENV/bin:$PATH"

# Auto hash XXOO_HOME
eval "$(env | grep _HOME | sed 's/\(.*\)=.*/hash -d \1="$\1"/')"

# dylink "$DYLD_FALLBACK_LIBRARY_PATH"

if [[ $TERM_PROGRAM == iTerm.app ]]; then
	archey -o
fi
