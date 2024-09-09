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
download-branch "$DIR/ui" MetaCubeX Yacd-meta gh-pages
echo

echo " --- === Updating config.json === ---"

restart() {
    echo
    echo " --- === Restarting sing-box === ---"
    if RESULT=$(sing-box -c "$DIR/config.json" check 2>&1); then
        "$DIR/restart.sh"
    else
        echo "$RESULT" >&2
    fi
}

mkdir -p dat
while read -r NAME URL; do
    proxy none wget "$URL" -O "dat/$NAME"
done <"$(current-script-directory)/clash.txt"

SING_RULES="$WORKSPACE/proxy/sing-rules"
DIRENV_LOG_FORMAT="" direnv exec "$SING_RULES/clash-to-sing.py" -c "$SING_RULES/config/config.json" |
    sing-box format -c /dev/stdin >config.json
copy-if-diff config.json "$DIR" restart
echo
