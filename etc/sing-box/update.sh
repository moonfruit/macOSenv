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

echo " --- === Update config.json === ---"
direnv exec "$ENV/package/yyscripts/xipcloud-sing.py" >config.json
copy-if-diff config.json "$DIR"

echo
echo " --- === Update geoip.db === ---"
download-latest-release "$DIR/geoip.db" SagerNet sing-geoip geoip.db

echo
echo " --- === Update geosite.db === ---"
download-latest-release "$DIR/geosite.db" SagerNet sing-geosite geosite.db

echo
echo " --- === Update ui === ---"
download-branch "$DIR/ui" MetaCubeX Yacd-meta gh-pages

#proxy wget https://github.com/MetaCubeX/Yacd-meta/archive/refs/heads/gh-pages.zip
#if ! diff gh-pages.zip "$DIR/gh-pages.zip"; then
#    unzip gh-pages.zip && rm -fr "$DIR/ui" && mv Yacd-meta-gh-pages "$DIR/ui"
#fi
