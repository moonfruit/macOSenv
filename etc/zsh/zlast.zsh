#!/usr/bin/env bash

# for GPP
# export APP_HOME="$WORKSPACE/gpp"
# export NODE_ID="YY"
# if [[ -f "$APP_HOME/etc/bashrc" ]]; then
# 	#shellcheck disable=SC1090
# 	NOCD=1 NOLANG=1 NOLUA=1 . "$APP_HOME/etc/bashrc"
# fi
APP_HOME="$WORKSPACE/gpp"
hash -d APP_HOME="$APP_HOME"
hash -d GAL_HOME="$APP_HOME/fw/gal"
hash -d GMQ_HOME="$APP_HOME/fw/gmq"
hash -d GSE_HOME="$APP_HOME/fw/gse"
hash -d GTELLER_HOME="$APP_HOME/apps/gteller"
hash -d CNAPS_HOME="$APP_HOME/apps/cnaps"
hash -d CIPS_HOME="$APP_HOME/apps/cips"
hash -d YY_HOME="$APP_HOME/apps/yy"

local prepend-path() {
    [[ -d "$1" ]] && PATH="$1:$PATH"
}

# for Docker
prepend-path "$HOME/.docker/bin"

# for JetBrains
for APP in "PyCharm" "IntelliJ IDEA"; do
    prepend-path "/Applications/$APP.app/Contents/MacOS"
done

# for CotEditor
prepend-path "/Applications/CotEditor.app/Contents/SharedSupport/bin"

# for PATH and MANPATH
prepend-path "/opt/homebrew/opt/grep/libexec/gnubin"
prepend-path "/opt/homebrew/opt/gnu-tar/libexec/gnubin"
prepend-path "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
prepend-path "/opt/homebrew/opt/findutils/libexec/gnubin"
prepend-path "/opt/homebrew/opt/file-formula/bin"
#prepend-path "/opt/homebrew/opt/curl/bin"
prepend-path "$ENV/bin"
export PATH

# Auto hash XXOO_HOME
eval "$(env | grep '_HOME$' | sed 's/\(.*\)=.*/hash -d \1="$\1"/')"

# dylink "$DYLD_FALLBACK_LIBRARY_PATH"

while [[ ${fpath[1]} == /opt/homebrew/share/zsh/site-functions ]]; do
	shift fpath
done
