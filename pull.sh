#!/bin/bash

if [[ $1 == gc ]]; then
	GC="git gc"
else
	GC=true
fi

if proxy; then
    PROXY=proxy
fi

DIR=$(pwd)
grep submodule .gitmodules | sed 's/.*"\(.*\)".*/\1/' | \
	while read -r MODULE; do
		echo "-------- $MODULE --------"
		cd "$DIR/$MODULE" || exit
		$PROXY git pull
		$GC
	done
