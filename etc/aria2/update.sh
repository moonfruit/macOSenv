#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy 2>/dev/null; then
    exec proxy "$0" "$@"
fi

TRACKERS=$(curl https://trackerslist.com/best_aria2.txt) || exit 1

source "$ENV/lib/bash/fs.sh"

DIR=$(main-script-directory)

create-temp-directory TEMP_DIR
cd "$TEMP_DIR" || exit 1

sed 's|^\(bt-tracker=\).*$|\1'"$TRACKERS"'|' "$DIR/aria2.conf" >aria2.conf

update-daemon() {
    proxy none curlie http://127.0.0.1:6800/jsonrpc id=$RANDOM method=aria2.changeGlobalOption \
        params:='["token:yy1234",{"bt-tracker":"'"$TRACKERS"'"}]' >&2
}

copy-if-diff aria2.conf "$DIR" update-daemon >/dev/null
