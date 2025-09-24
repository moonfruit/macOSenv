#!/usr/bin/env bash

set -euo pipefail
source "$ENV/lib/bash/native.sh"

BIN=$(current-script-directory)

mapfile -t OUTBOUNDS < <(jq -c '.outbounds[] | select(.tag | startswith("❇️"))' "$BIN/config/zoo.json")

NOT_FIRST=
for OUTBOUND in "${OUTBOUNDS[@]}"; do
    [[ -n $NOT_FIRST ]] && echo || NOT_FIRST=1
    TAG=$(echo "$OUTBOUND" | jq -r ".tag")
    echo "--- $TAG ---"
    COUNTRY=$(echo "$OUTBOUND" | "$BIN/find-country.sh") && echo "$TAG: $COUNTRY" || true
done
