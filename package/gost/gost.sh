#!/bin/bash
DIR=$(dirname "${BASH_SOURCE[0]}")
cd "$DIR" || exit 1

GOST="./gost"
CONFIG="gost.json"
PEER="peer.json"
SECRET="secret.json"

TEMP=$(mktemp -t gost.peer)
trap 'rm -f "$TEMP"' EXIT

"$ENV/bin/crypto.py" decrypt-file "$PEER" "$SECRET" >"$TEMP"
"$GOST" -C <("$ENV/bin/crypto.py" decrypt-file <(sed "s|peer=peer.json|peer=$TEMP|g" "$CONFIG") "$SECRET")
