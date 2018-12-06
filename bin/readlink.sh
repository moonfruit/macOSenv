#!/bin/bash

display() {
	FILE=$1
	while [[ -L "$FILE" ]]; do
		FILE=$(dirname "$FILE")/$(readlink  "$FILE")
	done
	(
		if [[ -e "$FILE" ]] && cd "$(dirname "$FILE")"; then
			echo "$(pwd)/$(basename "$FILE")"
		else
			echo "$FILE"
		fi
	)
}

for ARG in "$@"; do
	display "$ARG"
done
