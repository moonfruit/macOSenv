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

#convert() {
#    geo convert "$1" -i v2ray -o sing -f "$3" "$2"
#}

#echo " --- === Update geoip.db === ---"
#download-latest-release "$DIR/geoip.db" SagerNet sing-geoip geoip.db
#download-latest-release "$DIR/geoip.db" Loyalsoldier v2ray-rules-dat geoip.dat convert ip
#echo

#echo " --- === Update geosite.db === ---"
#download-latest-release "$DIR/geosite.db" SagerNet sing-geosite geosite.db
#download-latest-release "$DIR/geosite.db" Loyalsoldier v2ray-rules-dat geosite.dat convert site
#echo

echo " --- === Update ui === ---"
download-branch "$DIR/ui" MetaCubeX Yacd-meta gh-pages
echo

echo " --- === Update config.json === ---"

restart() {
    echo
    echo " --- === Restart sing-box === ---"
    if RESULT=$(sing-box -c "$DIR/config.json" check 2>&1); then
        "$DIR/restart.sh"
    else
        echo "$RESULT" >&2
    fi
}

curl ***REMOVED*** |
    DIRENV_LOG_FORMAT="" direnv exec "$WORKSPACE/proxy/sing-rules/clash-to-sing.py" |
    sing-box format -c /dev/stdin >config.json
copy-if-diff config.json "$DIR" restart
