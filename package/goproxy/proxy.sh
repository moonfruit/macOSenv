#!/bin/bash
if [[ -z "$1" ]]; then
	echo "No config file" >&2
	exit 1
fi

DIR=$(dirname "${BASH_SOURCE[0]}")
PROXY="${DIR}/proxy"
AUTH="${DIR}/proxy.auth"
AUTH=$("$ENV/bin/crypto.py" decrypt "$(cat "$AUTH")")

exec "$PROXY" @<(sed 's/<AUTH>/'"$AUTH"'/' "$1")

#TEMP=$(mktemp -t proxy)
#sed 's/<AUTH>/'"$AUTH"'/' "$1" >"$TEMP"
#exec "$PROXY" "@$TEMP"
