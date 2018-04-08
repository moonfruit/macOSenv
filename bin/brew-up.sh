#!/bin/bash

proxy brew update -v

OUTDATED=$(brew outdated)
if [[ -z $OUTDATED ]]; then
	exit 0
fi

if proxy brew upgrade; then
	exho "==> Cleanup"
	brew cleanup -s
fi
