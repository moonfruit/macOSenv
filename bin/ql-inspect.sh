#!/usr/bin/env bash
inspect() {
	QL=${1%/}
	if [[ $QL == *.qlgenerator ]]; then
		QL=$QL/Contents/Info.plist
	fi
	if [[ $QL != *.plist ]]; then
		echo "Unknown $QL" >&2
		exit 1
	fi

	PATTERN=$(plutil -convert json -o - "$QL" | jq -r '.CFBundleDocumentTypes[0].LSItemContentTypes | join("|")')
	if [[ -n $PATTERN ]]; then
		qlmanage -m plugins | sort | rg "$PATTERN"
	fi
}

while [[ $# -gt 0 ]]; do
	inspect "$1"
	shift
done
