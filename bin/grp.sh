#!/bin/bash
for REMOTE in $(git remote); do
	git remote prune "$REMOTE"
done
