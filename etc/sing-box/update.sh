#!/usr/bin/env bash
source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

DIR=$(main-script-directory)

create-temp-directory TEMP_DIR
cd "$TEMP_DIR" || exit 1

echo " --- === Update config.json === ---"
direnv exec "$ENV/package/yyscripts/xipcloud-sing.py" >config.json
copy-if-diff config.json "$DIR"
echo

echo " --- === Update geoip.db === ---"
copy-if-exists "$DIR/geoip.db" .
proxy wget -N https://github.com/SagerNet/sing-geoip/releases/latest/download/geoip.db
copy-if-diff geoip.db "$DIR"

echo " --- === Update geosite.db === ---"
copy-if-exists "$DIR/geosite.db" .
proxy wget -N https://github.com/SagerNet/sing-geosite/releases/latest/download/geosite.db
copy-if-diff geosite.db "$DIR"

echo " --- === Update ui === ---"
proxy wget https://github.com/MetaCubeX/Yacd-meta/archive/gh-pages.zip
if ! diff gh-pages.zip "$DIR/gh-pages.zip"; then
    unzip gh-pages.zip && rm -fr "$DIR/ui" && mv Yacd-meta-gh-pages "$DIR/ui"
fi
