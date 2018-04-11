#!/usr/bin/env bash

FOREGROUND=()
BACKGROUND=()
for i in {0..7}; do
    FOREGROUND+=("$(tput setaf $i)")
    BACKGROUND+=("$(tput setab $i)")
done
BOLD=$(tput bold)
RESET=$(tput sgr0)
TEST="gYw"

echo
echo "       0       1       2       3       4       5       6       7"

for i in {0..7}; do
    echo -n "  $i"
    for j in {0..7}; do
        echo -n " ${FOREGROUND[$i]}${BACKGROUND[$j]}  $TEST  $RESET"
    done
    echo

    echo -n " B$i"
    for j in {0..7}; do
        echo -n " ${FOREGROUND[$i]}${BACKGROUND[$j]}$BOLD  $TEST  $RESET"
    done
    echo
done

echo
