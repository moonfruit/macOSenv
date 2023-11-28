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

echo
echo " --- === Update config.json === ---"
direnv exec "$ENV/package/yyscripts/xipcloud-sing.py" >config.json
copy-if-diff config.json "$DIR" restart

# Support functions
convert() {
	geo convert "$1" -i v2ray -o sing -f "$3" "$2"
}

find-sing() {
	[[ -n "$1" ]] && ps -ef | head -1
	ps -ef | rg -w sing-box | sed -En \
		's/^(\s+[0-9]+\s+)([0-9]+)(\s+1\s.*?)(sing-box)/\1\x1b[32m\2\x1b[0m\3\x1b[1;31m\4\x1b[0m/p'
}

restart() {
	echo
	echo " --- === Restart sing-box === ---"
	if RESULT=$(sing-box -c "$DIR/config.json" check 2>&1); then
		find-sing 1
		killall sing-box
		sleep 0.5
		find-sing
	else
		echo "$RESULT" >&2
	fi
}
