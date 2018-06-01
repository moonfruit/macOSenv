#!/usr/bin/env bash
if wget -qT1 --spider http://www.baidu.com; then
	BIN=$(dirname "${BASH_SOURCE[0]}")
	exec "$BIN/proxy" brew update -v
fi
