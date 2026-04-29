#!/bin/bash
PREFIX=()
if [[ -z "$PROXY_ENABLED" ]] && hash proxy 2>/dev/null; then
    PREFIX+=(proxy)
fi
if [[ -z "$DIRENV_DIR" ]] && hash direnv 2>/dev/null; then
    PREFIX+=(direnv exec .)
fi

if ((${#PREFIX[@]})); then
    exec "${PREFIX[@]}" "$0" "$@"
fi

DIR=${BASH_SOURCE[0]%/*}
cd "$DIR" || exit 1

echo --- node ---
export NODE_OPTIONS="--disable-warning=DEP0169"
if [[ -f yarn.lock ]]; then
    yarn upgrade
else
    yarn install
fi

echo --- perl ---
cpanm --installdeps --notest .

echo --- python ---
pip install -U --upgrade-strategy eager -r requirements.txt pip setuptools wheel
pip list -o

echo --- ruby ---
if [[ ! -d vendor/ruby ]]; then
    bundle config set path vendor
fi
bundle update --all
