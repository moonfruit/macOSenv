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

echo " --- === Updating ui === ---"
download-latest-release "$DIR/ui" Zephyruso zashboard 'endswith("dist.zip")'
echo

echo " --- === Updating config.json === ---"

mkdir -p dat
while read -r NAME URL; do
    proxy none wget "$URL" -O "dat/$NAME"
done < <(rg -v '^#' "$(current-script-directory)/clash.txt")

clash-to-sing() {
    local SING_RULES="$WORKSPACE/proxy/sing-rules"
    DIRENV_LOG_FORMAT="" direnv exec \
        "$SING_RULES/clash-to-sing.py" -lc "$SING_RULES/config/config.json"
}

restart-sing() {
    echo
    echo " --- === Restarting sing-box === ---"
    if RESULT=$(sing-box -C "$DIR/config" check 2>&1); then
        sudo launchctl kill SIGHUP system/moonfruit.sing
    else
        echo "$RESULT" >&2
    fi
}

if clash-to-sing | sing-box format -c /dev/stdin >zoo.json; then
    copy-if-diff zoo.json "$DIR/config" restart-sing
fi
echo
