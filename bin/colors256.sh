#!/usr/bin/env bash

FOREGROUND=()
# BACKGROUND=()
for i in {0..255}; do
    FOREGROUND+=("$(tput setaf $i)")
    # BACKGROUND+=("$(tput setab $i)")
done
# BOLD=$(tput bold)
RESET=$(tput sgr0)
TEST="gYw"

echo
echo "        0       1       2       3       4       5       6       7       8       9      10      11      12      13      14      15"

for i in {0..15}; do
    if [[ $i -lt 10 ]]; then
        echo -n "   $i"
    elif [[ $i -lt 100 ]]; then
        echo -n "  $i"
    else
        echo -n " $i"
    fi
    for j in {0..15}; do
        index=$((i * 16 + j))
        echo -n " ${FOREGROUND[$index]}  $TEST  $RESET"
    done
    echo
done

echo
