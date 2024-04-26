on run argv
	tell application "Finder"
		repeat with arg in argv
			delete arg as POSIX file
		end repeat
	end tell
end run
