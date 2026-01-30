#!/usr/bin/env bash

source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/github.sh"
source "$ENV/lib/bash/native.sh"

DIR=$(main-script-directory)
SING_RULES="$WORKSPACE/proxy/sing-rules"

create-temp-directory TEMP_DIR
cd "$TEMP_DIR" || exit 1

h1 Updating config.json

mkdir -p dat
while read -r NAME URL UA; do
    if [[ -n $UA ]]; then
        wget "$URL" -U "$UA/*" -O "dat/$NAME" || exit 1
    else
        wget "$URL" -O "dat/$NAME" || exit 1
    fi
    if "$SING_RULES/get-subscription-userinfo.sh" "$URL" | tee "dat/$NAME.info"; then
        echo
    else
        rm "dat/$NAME.info"
    fi
done < <(rg -v '^#' "$DIR/clash.txt")

clash-to-sing() {
    DIRENV_LOG_FORMAT="" direnv exec \
        "$SING_RULES/clash-to-sing.py" -lr \
        -c "$SING_RULES/config/config.json" \
        -s "$SING_RULES/preflight/saved-countries.json" \
        -t "c1f6ba66dd5b8620b26ac68f2fad7a52"
}

restart-sing() {
    h2 Restarting sing-box
    if RESULT=$(sing-box -C "$DIR/config" check 2>&1); then
        sudo launchctl kill TERM system/moonfruit.sing
        sleep 1
    else
        echo "$RESULT" >&2
    fi
    echo
}

if clash-to-sing | sing-box format -c /dev/stdin >zoo.json; then
    copy-if-diff zoo.json "$DIR/config" restart-sing
fi
