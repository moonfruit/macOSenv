#!/bin/bash
source "$ENV/lib/bash/native.sh"
DIR=$(main-script-directory)
cd "$DIR" || exit 1

SINGBOX=sing-box
#SINGBOX=/opt/homebrew/bin/sing-box
#SINGBOX="$GOPATH/mod/sing-box/sing-box"

sudo "$SINGBOX" run -C config
