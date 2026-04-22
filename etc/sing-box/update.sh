#!/usr/bin/env bash
source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/github.sh"
source "$ENV/lib/bash/native.sh"

DIR=$(main-script-directory)
SING_RULES="$WORKSPACE/proxy/sing-rules"

if [[ -n "$1" ]]; then
    cd "$1" || exit 1
else
    create-temp-directory TEMP_DIR
    cd "$TEMP_DIR" || exit 1
fi

h1 Updating config.json

mkdir -p dat
while read -r NAME URL UA; do
    # 如果 dat/$NAME 已存在则跳过
    if [[ -f "dat/$NAME" ]]; then
        h2 Skipping "$NAME" - already exists
        continue
    fi
    h2 Downloading "$NAME"
    "$SING_RULES/subscribe.sh" "$URL" "dat/$NAME" "$UA" || exit 1
done < <(rg -v '^#' "$DIR/clash.txt")

sing-exec() {
    DIRENV_LOG_FORMAT="" direnv exec "$@"
}

clash-to-sing() {
    sing-exec "$SING_RULES/clash-to-sing.py" -lr \
        -c "$SING_RULES/config/config.json" \
        -s "$SING_RULES/preflight/saved-countries.json" \
        -t "$(cat "$DIR/gitee.txt")"
}

restart-sing() {
    h2 Restarting sing-box
    if RESULT=$(sing-box -C "$DIR/config" check 2>&1); then
        sudo launchctl kill TERM system/moonfruit.sing-box
        sleep 1
    else
        echo "$RESULT" >&2
    fi
    echo
}

h2 Generating config.json
if clash-to-sing | sing-box format -c /dev/stdin | sing-exec "$SING_RULES/fix-format.py" >zoo.json; then
    copy-if-diff zoo.json "$DIR/config" restart-sing
fi
