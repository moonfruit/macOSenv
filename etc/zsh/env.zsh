#!/usr/bin/env bash

# lang
export LANG=zh_CN.UTF-8

# tools
export EDITOR=vim

# catalog
export XML_CATALOG_FILES="$ENV/package/vim/XMLCatalog/catalog.xml"

# for zsh
# shellcheck disable=SC2034
DEFAULT_USER=moon

# for proxy
if [[ -z $no_proxy ]]; then
	source $ENV/etc/no_proxy.sh
fi

# for crypto
export YY_PASSWORD="$ENV/etc/private.txt"
