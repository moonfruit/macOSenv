# for GPP
export APP_HOME="$WORKSPACE/gpp"
export NODE_ID="YY"

if [[ -f "$APP_HOME/etc/bashrc" ]]; then
	NOCD=1 source "$APP_HOME/etc/bashrc"
fi

# for PATH
USER_PYTHON_HOME="/Users/moon/Library/Python/2.7"
export PATH="$ENV/bin:$USER_PYTHON_HOME/bin:$PATH"

# Auto hash XXOO_HOME
eval "$(env | grep _HOME | sed 's/\(.*\)=.*/hash -d \1="$\1"/')"

# dylink "$DYLD_FALLBACK_LIBRARY_PATH"

if [[ $TERM_PROGRAM == iTerm.app ]]; then
	archey -o
fi
