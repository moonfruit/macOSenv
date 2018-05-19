#!/bin/bash

# tools
export EDITOR='vim'
unset GREP_OPTIONS
unset GREP_COLOR

# catalog
export XML_CATALOG_FILES="$ENV/package/vim/XMLCatalog/catalog.xml"

# for zsh
DEFAULT_USER="moon"

# for proxy
# if [[ -z "$no_proxy" ]]; then
# 	printf -v no_proxy '%s,' 10.1.2.{1..255}
# 	export no_proxy="localhost,127.0.0.1,${no_proxy}192.168.1.1,192.168.7.1"
# fi
