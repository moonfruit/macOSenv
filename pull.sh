#!/bin/bash

#if [[ -z "$PROXY_ENABLED" ]] && hash proxy >/dev/null 2>&1; then
#	exec proxy "$0" "$@"
#fi

if [[ $1 == gc ]]; then
	GC="git gc"
else
	GC=true
fi

DIR=$(pwd)
grep submodule .gitmodules | sed 's/.*"\(.*\)".*/\1/' | sort | \
	while read -r MODULE; do
		echo "-------- $MODULE --------"
		cd "$DIR/$MODULE" || exit
		git checkout master
		git pull
		$GC
	done
