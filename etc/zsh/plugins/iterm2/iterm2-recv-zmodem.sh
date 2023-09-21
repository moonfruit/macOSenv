#!/bin/bash
if DIR=$(osascript -e '
		tell application "iTerm" to set output to choose folder
		copy POSIX path of output to stdout
' 2>/dev/null); then
	cd "$DIR" && exec /opt/homebrew/bin/rz -beE
fi
echo -e '\x18\x18\x18\x18\x18'
