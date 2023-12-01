#!/usr/bin/env bash

if [[ -z "$PROXY_ENABLED" ]] && hash proxy 2>/dev/null; then
	exec proxy "$0" "$@"
fi

TRACKERS=$(curl https://trackerslist.com/best_aria2.txt) || exit 1

sed -i 's|^\(bt-tracker=\).*$|\1'"$TRACKERS"'|' aria2.conf

curlie http://127.0.0.1:6800/jsonrpc id=$RANDOM method=aria2.changeGlobalOption \
    params:='["token:yy1234",{"bt-tracker":"'"$TRACKERS"'"}]'
