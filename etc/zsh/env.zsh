#!/usr/bin/env bash

# lang
export LANG=zh_CN.UTF-8

# tools
export EDITOR=vim
unset GREP_OPTIONS
unset GREP_COLOR

# catalog
export XML_CATALOG_FILES="$ENV/package/vim/XMLCatalog/catalog.xml"

# for zsh
# shellcheck disable=SC2034
DEFAULT_USER=moon

# for proxy
if [[ -z "$no_proxy" ]]; then
	printf -v no_proxy ',%s' 10.1.{1..3}.{1..254}
	printf -v no_proxy2 ',%s' 192.168.1.{1..254}
	export no_proxy="localhost,127.0.0.1${no_proxy}${no_proxy2}"
fi

# for crypto
export YY_PASSWORD="$ENV/etc/private.txt"

# for homebrew
export HOMEBREW_BAT=true
export HUB_REMOTE=moonfruit
