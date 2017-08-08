#!/bin/sh

DIR=$(pwd)
grep submodule .gitmodules | sed 's/.*"\(.*\)".*/\1/' | \
	while read -r MODULE; do
		cd "$DIR/$MODULE" || exit
		git pull
	done
