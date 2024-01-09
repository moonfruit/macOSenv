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
    local bin=$1
    local dir
    if [[ -d $bin ]]; then
        if [[ $bin = */gnubin ]]; then
            dir=${bin%/*}
            bin=$dir/bin
            if [[ ! -e $bin ]]; then
                (cd $dir && ln -s gnubin bin)
            fi
        fi
        PATH="$bin:$PATH"
    fi
}

# for JetBrains
for APP in "DataGrip" "GoLand" "PyCharm" "IntelliJ IDEA"; do
    prepend-path "/Applications/$APP.app/Contents/MacOS"
done

# for PATH and MANPATH
# prepend-path "/opt/homebrew/opt/grep/libexec/gnubin"
prepend-path "/opt/homebrew/opt/gnu-tar/libexec/gnubin"
prepend-path "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
prepend-path "/opt/homebrew/opt/gawk/libexec/gnubin"
# prepend-path "/opt/homebrew/opt/findutils/libexec/gnubin"
prepend-path "/opt/homebrew/opt/gnu-getopt/bin"
prepend-path "/opt/homebrew/opt/file-formula/bin"
# prepend-path "/opt/homebrew/opt/curl/bin"
prepend-path "$ENV/bin"
export PATH

# Auto hash XXOO_HOME
eval "$(env | rg '_HOME' | sed 's/\(.*\)=.*/hash -d \1="$\1"/')"

# dylink "$DYLD_FALLBACK_LIBRARY_PATH"

while [[ ${fpath[1]} == /opt/homebrew/share/zsh/site-functions ]]; do
	shift fpath
done
