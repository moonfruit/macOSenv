#!/usr/bin/env bash
source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/github.sh"
source "$ENV/lib/bash/native.sh"

DIR=$(main-script-directory)
CACHE="$DIR/cache"
SING_RULES="$WORKSPACE/proxy/sing-rules"

if [[ -n "$1" ]]; then
    cd "$1" || exit 1
else
    create-temp-directory TEMP_DIR
    cd "$TEMP_DIR" || exit 1
fi

h1 Updating zashboard.json
ZASHBOARD="$DIR/ui/zashboard.json"
if [[ ! -e "$ZASHBOARD" ]]; then
    sudo touch "$ZASHBOARD"
fi
if [[ ! -w "$ZASHBOARD" ]]; then
    sudo chown "$(whoami)" "$ZASHBOARD"
    sudo chmod u+w "$ZASHBOARD"
fi

if [[ ! -s "$ZASHBOARD" ]] || (($(stat -f %m "$ZASHBOARD") < $(date -v-1d +%s))); then
    zashboard-iplabels.py >zashboard.json
    copy-if-diff zashboard.json "$DIR/ui" || true
else
    h2 Skipping zashboard.json - updated within 1 day
fi

h1 Updating config.json

mkdir -p dat "$CACHE"
while read -r NAME URL UA; do
    # 如果 dat/$NAME 已存在则跳过
    if [[ -f "dat/$NAME" ]]; then
        h2 Skipping "$NAME" - already exists
        continue
    fi
    h2 Downloading "$NAME"
    if "$SING_RULES/subscribe.sh" "$URL" "dat/$NAME" "$UA"; then
        cp -p "dat/$NAME" "$CACHE/$NAME"
        [[ -f "dat/$NAME.info" ]] && cp -p "dat/$NAME.info" "$CACHE/$NAME.info"
    elif [[ -f "$CACHE/$NAME" ]]; then
        warn "Failed to download $NAME, using cached copy"
        cp -p "$CACHE/$NAME" "dat/$NAME"
        [[ -f "$CACHE/$NAME.info" ]] && cp -p "$CACHE/$NAME.info" "dat/$NAME.info"
    else
        echo "Failed to download $NAME and no cached copy exists" >&2
        exit 1
    fi
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
