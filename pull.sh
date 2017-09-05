#!/bin/sh

DIR=$(pwd)
grep submodule .gitmodules | sed 's/.*"\(.*\)".*/\1/' | \
	while read -r MODULE; do
		echo "-------- $MODULE --------"
		cd "$DIR/$MODULE" || exit
		git pull
	done
