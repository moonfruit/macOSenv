#!/usr/bin/env bash

find-sing() {
    local pattern='s/^(\s+\S+\s+)(\S+)(\s+1\s.*?)\b(sing-box)\b/\1\x1b[32m\2\x1b[0m\3\x1b[1;31m\4\x1b[0m/p'
    [[ -n "$1" ]] && pattern+=";1p"
    ps -ef | sed -En "$pattern"
}

find-sing 1
sudo killall sing-box
sleep 0.5
find-sing
