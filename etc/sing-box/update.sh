#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy 2>/dev/null; then
    exec proxy "$0" "$@"
fi

source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/github.sh"
source "$ENV/lib/bash/native.sh"

DIR=$(main-script-directory)

create-temp-directory TEMP_DIR
cd "$TEMP_DIR" || exit 1

# echo " --- === Updating ui === ---"
# download-latest-release "$DIR/ui" Zephyruso zashboard 'endswith("dist.zip")'
# echo

echo " --- === Updating config.json === ---"

mkdir -p dat
while read -r NAME URL UA; do
    if [[ -n $UA ]]; then
        proxy none wget "$URL" -U "$UA/*" -O "dat/$NAME"
    else
        proxy none wget "$URL" -O "dat/$NAME"
    fi
done < <(rg -v '^#' "$(current-script-directory)/clash.txt")

clash-to-sing() {
    local SING_RULES="$WORKSPACE/proxy/sing-rules"
    DIRENV_LOG_FORMAT="" direnv exec \
        "$SING_RULES/clash-to-sing.py" -lr \
        -c "$SING_RULES/config/config.json" \
        -s "$SING_RULES/preflight/saved-countries.json" \
        -t "c1f6ba66dd5b8620b26ac68f2fad7a52"
}

restart-sing() {
    echo
    echo " --- === Restarting sing-box === ---"
    if RESULT=$(sing-box -C "$DIR/config" check 2>&1); then
        sudo launchctl kill TERM system/moonfruit.sing
        sleep 1
    else
        echo "$RESULT" >&2
    fi
}

if clash-to-sing | sing-box format -c /dev/stdin >zoo.json; then
    copy-if-diff zoo.json "$DIR/config" restart-sing
fi
echo
