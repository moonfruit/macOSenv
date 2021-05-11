#!/usr/bin/env bash
echo ======== $$ BEGIN at "$(date)" ========
if wget -qT1 --spider http://www.baidu.com; then
	BIN=$(dirname "${BASH_SOURCE[0]}")
	"$BIN/proxy" brew update -v
fi
echo ======== $$ END at "$(date)" ========
