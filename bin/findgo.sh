#!/bin/bash

while getopts '0' OPT; do
	case $OPT in
		0) FLAGS+=(-print0);;
		?) echo "Unknown flags" >&2; exit 1;;
	esac
done
shift "$((OPTIND - 1))"

DIR="$1"
if [ -z "$DIR" ]; then
	DIR=.
fi

find "$DIR" -not \( \
	\( \
		-not -name "." -name ".*" -o \
		-name 'vendor' \
	\) -prune \
\) -name "*.go" "${FLAGS[@]}"
