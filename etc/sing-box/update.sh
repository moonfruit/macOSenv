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

convert() {
	geo convert "$1" -i v2ray -o sing -f "$3" "$2"
}

echo " --- === Update config.json === ---"
direnv exec "$ENV/package/yyscripts/xipcloud-sing.py" >config.json
copy-if-diff config.json "$DIR"

echo
echo " --- === Update geoip.db === ---"
# download-latest-release "$DIR/geoip.db" SagerNet sing-geoip geoip.db
download-latest-release "$DIR/geoip.db" Loyalsoldier v2ray-rules-dat geoip.dat convert ip

echo
echo " --- === Update geosite.db === ---"
# download-latest-release "$DIR/geosite.db" SagerNet sing-geosite geosite.db
download-latest-release "$DIR/geosite.db" Loyalsoldier v2ray-rules-dat geosite.dat convert site

echo
echo " --- === Update ui === ---"
download-branch "$DIR/ui" MetaCubeX Yacd-meta gh-pages

echo " --- === Restart sing-box === ---"
ps -ef | rg -w sing-box | rg -wv 'bash|rg'
killall sing-box
sleep 0.5
ps -ef | rg -w sing-box | rg -wv 'bash|rg'
