#!/bin/bash

clean() {
	for REMOTE in $(git remote); do
		git remote prune "$REMOTE"
	done
}

if [[ $# -gt 0 ]]; then
	while [[ $# -gt 0 ]]; do
		(cd "$1" && clean)
		shift
	done
else
	clean
fi
