#!/bin/bash

clean() {
    for REMOTE in $(git remote); do
        git remote prune "$REMOTE"
    done
}

if [[ $# -gt 0 ]]; then
    while [[ $# -gt 0 ]]; do
        if [[ -d "$1" && -e "$1/.git" ]]; then
            (cd "$1" && clean)
        fi
        shift
    done
else
    clean
fi
