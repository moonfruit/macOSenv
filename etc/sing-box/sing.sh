#!/bin/bash
source "$ENV/lib/bash/native.sh"
DIR=$(main-script-directory)
cd "$DIR" || exit 1
/opt/homebrew/bin/sing-box run -c config.json
