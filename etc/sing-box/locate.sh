#!/usr/bin/env bash

source "$ENV/lib/bash/json.sh"

set -euo pipefail

readonly GLOBAL="http://127.0.0.1:9999/proxies/GLOBAL"
readonly INFO="http://ipinfo.io"

BIN=$(current-script-directory)

mapfile -t PROXIES < <(curl -fsSL "$GLOBAL" | jq -r '.all-["DIRECT","REJECT"]|.[]')

locate() {
    local previous
    previous=$(curl -fsSL "$GLOBAL" | jq -r .now)

    curlie -s PUT "$GLOBAL" name="$1"
    if ! proxy 7892 curl -fsL "$INFO" | jq -r .country; then
        echo "UN"
    fi

    if [[ -n "$previous" ]]; then
        curlie -s PUT "$GLOBAL" name="$previous"
    fi
}

declare -A TAG_SERVER
while IFS=$'\t' read -r TAG SERVER; do
    TAG_SERVER["$TAG"]="$SERVER"
done < <(jq -r '.outbounds[] | select(.server) | "\(.tag)	\(.server)"' "$BIN/config/zoo.json")

declare -A SERVER_COUNTRY
for PROXY in "${PROXIES[@]}"; do
    if [[ $PROXY == ❇️* ]]; then
        COUNTRY=$(locate "$PROXY")
        if [[ $COUNTRY != "UN" ]]; then
            SERVER=${TAG_SERVER[$PROXY]}
            # shellcheck disable=SC2034
            SERVER_COUNTRY["$SERVER"]="$COUNTRY"
        fi
    fi
done

as-json SERVER_COUNTRY | jq .
