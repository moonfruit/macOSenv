#!/opt/homebrew/bin/bash
DIR=$(dirname "${BASH_SOURCE[0]}")

TEMP=$(mktemp)
trap 'rm -f $TEMP' EXIT

grep -v '^bt-tracker=' "$DIR/aria2.conf" >"$TEMP"
cat "$DIR/trackers.conf" >>"$TEMP"

( (
    sleep 60
    rm -f "$TEMP"
) &) &
wait

exec /opt/homebrew/bin/aria2c "--conf-path=$TEMP" "$@"
