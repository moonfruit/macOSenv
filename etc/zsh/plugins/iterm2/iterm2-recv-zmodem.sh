#!/usr/bin/env bash
if DIR=$(osascript -l JavaScript -e '
	const app = Application.currentApplication();
	app.includeStandardAdditions = true;
	app.chooseFolder().toString();
' 2>/dev/null); then
    cd "$DIR" && exec /opt/homebrew/bin/rz -beE
fi
echo -e '\x18\x18\x18\x18\x18'
