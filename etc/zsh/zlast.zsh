#!/usr/bin/env bash

# for GPP
APP_HOME="$WORKSPACE/gpp"
hash -d APP_HOME="$APP_HOME"
hash -d GAL_HOME="$APP_HOME/fw/gal"
hash -d GMQ_HOME="$APP_HOME/fw/gmq"
hash -d GSE_HOME="$APP_HOME/fw/gse"
hash -d GTELLER_HOME="$APP_HOME/apps/gteller"
hash -d CNAPS_HOME="$APP_HOME/apps/cnaps"
hash -d CIPS_HOME="$APP_HOME/apps/cips"
hash -d YY_HOME="$APP_HOME/apps/yy"

# export APP_HOME
# if [[ -f "$APP_HOME/etc/bashrc" ]]; then
#     #shellcheck disable=SC1090
#     NOCD=1 NOLANG=1 NOLUA=1 . "$APP_HOME/etc/bashrc"
# fi

# Auto hash XXOO_HOME
eval "$(env | rg '_HOME' | sed 's/\(.*\)=.*/hash -d \1="$\1"/')"

# for PATH
local prepend-path() {
    local bin=$1
    local dir
    if [[ -d $bin ]]; then
        if [[ $bin = */gnubin && ! -d "$bin/man" ]]; then
            dir=${bin%/*}
            bin=$dir/bin
            if [[ ! -e $bin ]]; then
                (cd $dir && ln -s gnubin bin)
            fi
        fi
        PATH="$bin:$PATH"
    fi
}
prepend-path "$BREW_PREFIX/opt/postgresql@15/bin"
prepend-path "$BREW_PREFIX/opt/postgresql@16/bin"
prepend-path "$BREW_PREFIX/opt/postgresql@17/bin"
prepend-path "$BREW_PREFIX/opt/tscurl/bin"
prepend-path "$BREW_PREFIX/opt/ruby/bin"
prepend-path "$BREW_PREFIX/opt/p7zip-all/bin"
prepend-path "$BREW_PREFIX/opt/lsof/bin"
prepend-path "$BREW_PREFIX/opt/grep/libexec/gnubin"
prepend-path "$BREW_PREFIX/opt/gnu-tar/libexec/gnubin"
prepend-path "$BREW_PREFIX/opt/gnu-sed/libexec/gnubin"
prepend-path "$BREW_PREFIX/opt/gnu-getopt/bin"
prepend-path "$BREW_PREFIX/opt/gawk/libexec/gnubin"
prepend-path "$BREW_PREFIX/opt/findutils/libexec/gnubin"
prepend-path "$BREW_PREFIX/opt/file-formula/bin"
prepend-path "$BREW_PREFIX/opt/curl/bin"
prepend-path "$ENV/bin/extern"
prepend-path "$ENV/bin"
export PATH

# for DYLD_LIBRARY_PATH
[[ -n "$DYLD_FALLBACK_LIBRARY_PATH" ]] && dylink "$DYLD_FALLBACK_LIBRARY_PATH"

# for fpath
while [[ ${fpath[1]} == "$BREW_PREFIX/share/zsh/site-functions" ]]; do
	shift fpath
done

# for sqlplus
if (($+commands[sqlplus])) && (($+commands[rlwrap])); then
    function sqlplus() {
        if [[ $# == 0 && $DBI_TYPE == "oracle" && -z $DBI_ENCRYPT && -n $DBI_CONNSTR ]]; then
            rlwrap sqlplus "$DBI_CONNSTR"
        else
            rlwrap sqlplus "$@"
        fi
    }
fi
