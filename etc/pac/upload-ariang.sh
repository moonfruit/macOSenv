#!/usr/bin/env bash

download() {
	local last
	if [[ -f ariang.url ]]; then
		last=$(cat ariang.url)
	fi
	if [[ $1 == "$last" ]]; then
		return
	fi
	if wget "$1" -O ariang.zip; then
		rm -r ariang
		unzip ariang.zip -d ariang
		rm ariang.zip
		echo "$1" >ariang.url
	fi
}

if URL=$(curl https://api.github.com/repos/mayswind/AriaNg/releases/latest |
	jq -r 'first(.assets[].browser_download_url | select(endswith("-AllInOne.zip")))'); then
	if [[ -n $URL ]]; then
		download "$URL"
	fi
fi
