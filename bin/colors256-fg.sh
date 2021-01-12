#!/usr/bin/env bash

FOREGROUND=()
for ((i=0; i<256; i++)); do
    FOREGROUND+=("$(tput setaf "$i")")
done
BACKGROUND=$(tput setab 0)
RESET=$(tput sgr0)

color=0
print-color() {
	if [[ $((color%2)) = 0 ]]; then
		B=
	else
		B=$BACKGROUND
	fi
	printf "%s%s %$1d%s" "$B" "${FOREGROUND[$color]}" $color "$RESET"
	((color+=1))
}

for ((i=0; i<16; i++)); do
	print-color 8
done
echo

for ((i=0; i<6; i++)); do
	for ((j=0; j<36; j++)); do
		print-color 3
	done
	echo
done

for ((i=0; i<24; i++)); do
	print-color 5
done
echo
