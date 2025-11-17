#!/usr/bin/env bash
# shellcheck disable=2207
if IFS=$'\n' FILES=($(osascript -l JavaScript -e '
	const app = Application.currentApplication();
	app.includeStandardAdditions = true;
	app.chooseFile({ multipleSelectionsAllowed: true }).join("\n");
' 2>/dev/null)); then
    exec /opt/homebrew/bin/sz -beE "${FILES[@]}"
fi
echo -e '\x18\x18\x18\x18\x18'
