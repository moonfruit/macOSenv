#!/usr/bin/osascript
tell application "iTerm" to set theFiles to choose file with multiple selections allowed
set output to null
repeat with theFile in theFiles
	if output is null then
		set output to POSIX path of theFile
	else
		set output to output & "\n" & POSIX path of theFile
	end if
end repeat
copy output to stdout
