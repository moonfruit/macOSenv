#!/usr/bin/env bash
# shellcheck disable=2207
if IFS=$'\n' FILES=($(osascript -e '
tell application "iTerm" to set theFiles to choose file with multiple selections allowed
set output to null
repeat with theFile in theFiles
	if output is null then
		set output to POSIX path of theFile
	else
		set output to output & "\n" & POSIX path of theFile
	end if
end repeat
copy output to stdout' 2>/dev/null)); then
	exec /opt/homebrew/bin/sz -beE "${FILES[@]}"
fi
echo -e '\x18\x18\x18\x18\x18'
