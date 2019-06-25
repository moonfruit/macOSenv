#!/bin/bash
CONFIG=$1
if [[ -z $CONFIG ]]; then
	echo No config!
	exit 1
fi

LISTEN=$2
DIR=$(dirname "${BASH_SOURCE[0]}")
GOST="${DIR}/gost"
SECRET="${DIR}/secret.json"

if [[ -z $LISTEN ]]; then
	exec "$GOST" -C <("$ENV/bin/crypto.py" decrypt-file "$CONFIG" "$SECRET")
else
	exec "$GOST" -C <("$ENV/bin/crypto.py" decrypt-file <(sed "s/localhost:[0-9]*/$LISTEN/" "$CONFIG") "$SECRET")
fi
