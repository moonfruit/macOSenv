# for GPP
export APP_HOME="$WORKSPACE/gpp"
export NODE_ID="YY"

if [[ -f "$APP_HOME/etc/bashrc" ]]; then
	NOCD=1 source "$APP_HOME/etc/bashrc"
fi

# source =(env | grep _HOME | sed 's/\(.*\)=.*/hash -d \1="$\1"/')
eval "$(env | grep _HOME | sed 's/\(.*\)=.*/hash -d \1="$\1"/')"

# for PATH
USER_PYTHON_HOME="/Users/moon/Library/Python/2.7"
export PATH="/opt/subversion/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$ENV/bin:$USER_PYTHON_HOME/bin:$PATH"

# catalog
export XML_CATALOG_FILES="$ENV/package/vim/XMLCatalog/catalog.xml"

# brew command-not-found
if brew command command-not-found-init > /dev/null 2>&1; then
	eval "$(brew command-not-found-init)"
fi

# dylink "$DYLD_FALLBACK_LIBRARY_PATH"
archey -o
