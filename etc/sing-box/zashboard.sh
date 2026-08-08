#!/usr/bin/env bash
source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

DIR=$(main-script-directory)
UI="$DIR/ui"
NAME=zashboard-settings.json
SETTINGS="$UI/$NAME"

h1 "Updating $NAME"

if [[ ! -e "$SETTINGS" ]]; then
    sudo touch "$SETTINGS"
fi
if [[ ! -w "$SETTINGS" ]]; then
    sudo chown "$(whoami)" "$SETTINGS"
    sudo chmod u+w "$SETTINGS"
fi

if [[ -s "$SETTINGS" ]] && (($(stat -f %m "$SETTINGS") >= $(date -v-1d +%s))); then
    h2 "Skipping $NAME - updated within 1 day"
    exit 0
fi

create-temp-directory TEMP_DIR
# shellcheck disable=SC2154
zashboard-iplabels.py >"$TEMP_DIR/$NAME"
copy-if-diff "$TEMP_DIR/$NAME" "$UI" || true
