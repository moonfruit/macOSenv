# for zmv
autoload -U zmv

# for GPP
export APP_HOME="$WORKSPACE/gpp"
export NODE_ID="YY"

if [[ -f "$APP_HOME/etc/bashrc" ]]; then
	NOCD=1 source "$APP_HOME/etc/bashrc"
fi

eval "$(env | grep _HOME | sed 's/\(.*\)=.*/hash -d \1="$\1"/')"

# for PATH
# USER_PYTHON_HOME="/Users/moon/Library/Python/2.7"
# export PATH="$ENV/bin:$USER_PYTHON_HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$ENV/bin:$PATH"

# catalog
export XML_CATALOG_FILES="$ENV/package/vim/XMLCatalog/catalog.xml"

# brew command-not-found (too slow)
# if brew command command-not-found-init > /dev/null 2>&1; then
#	eval "$(brew command-not-found-init)"
# fi
if [[ -f /usr/local/Homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh ]]; then
	. /usr/local/Homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh
fi

# dylink "$DYLD_FALLBACK_LIBRARY_PATH"
archey -o
