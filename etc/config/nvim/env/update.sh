#!/bin/bash
if [[ -z "$PROXY_ENABLED" ]] && hash proxy 2>/dev/null; then
    exec proxy "$0" "$@"
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
pip install -U -r requirements.txt pip
pip list -o

echo --- ruby ---
if [[ ! -d vendor/ruby ]]; then
    bundle config set path vendor
fi
bundle update --all
