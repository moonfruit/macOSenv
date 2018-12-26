#!/bin/bash

if [[ -n $2 ]]; then
	FONTS=$1
	DISPLAY=$2
elif [[ -n $1 ]]; then
	DISPLAY=$1
fi

if [[ -z $FONTS ]]; then
	FONTS=$(figlist | sed '1,/Figlet fonts/d;/Figlet control files/,$d')
fi

for FONT in $FONTS; do
	echo "-------- $FONT --------"
	display=$DISPLAY
	if [[ -z $display ]]; then
		display=$FONT
	fi
	figlet -w 120 -f "$FONT" "$display"
done
