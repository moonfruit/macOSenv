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

# for Docker
DOCKER="$HOME/.docker/bin"
[[ -d "$DOCKER" ]] && PATH="$DOCKER:$PATH"

# for JetBrains
for APP in "IntelliJ IDEA" "PyCharm"; do
    APP_EXEC="/Applications/$APP.app/Contents/MacOS"
    [[ -d "$APP_EXEC" ]] && PATH="$APP_EXEC:$PATH"
done

# for PATH and MANPATH
PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/file-formula/bin:$PATH"
# PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="$ENV/bin:$PATH"

# Auto hash XXOO_HOME
eval "$(env | grep '_HOME$' | sed 's/\(.*\)=.*/hash -d \1="$\1"/')"

# dylink "$DYLD_FALLBACK_LIBRARY_PATH"

while [[ ${fpath[1]} == /opt/homebrew/share/zsh/site-functions ]]; do
	shift fpath
done
