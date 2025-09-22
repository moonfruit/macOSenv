#!/bin/bash
SIGNAL=${1:-TERM}
sudo launchctl kill "$SIGNAL" system/moonfruit.sing
