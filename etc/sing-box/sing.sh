#!/bin/bash
DIR=$(dirname "${BASH_SOURCE[0]}")
cd "$DIR" || exit 1
/opt/homebrew/bin/sing-box run -c config.json
