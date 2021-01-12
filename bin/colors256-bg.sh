#!/usr/bin/env bash

FOREGROUND=
BACKGROUND=()
for ((i=0; i<256; i++)); do
    BACKGROUND+=("$(tput setab "$i")")
done
RESET=$(tput sgr0)

color=0
print-color() {
	if [[ $((color%2)) = 0 ]]; then
		F=
	else
		F=$FOREGROUND
	fi
	printf "%s%s %$1d%s" "$F" "${BACKGROUND[$color]}" $color "$RESET"
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
