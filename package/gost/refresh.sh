#!/usr/bin/env bash
launchctl start moonfruit.gost.xipcloud

until [[ $(launchctl list | grep moonfruit.gost.xipcloud | awk '{print $1}') = '-' ]]; do
	sleep 0.1
done

launchctl stop moonfruit.gost
