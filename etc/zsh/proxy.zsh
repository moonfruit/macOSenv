#!/usr/bin/env bash

set-proxy() {
	if [[ $1 == unset ]]; then
		unset http_proxy https_proxy all_proxy
	elif [[ -z $1 ]]; then
		if [[ -n $http_proxy || -n $https_proxy || -n $all_proxy ]]; then
			unset http_proxy https_proxy all_proxy
		else
			eval "$(proxy env | sed -rn 's/^((https?|all)_proxy)/export \1/p')"
		fi
	else
		eval "$(proxy "$1" env | sed -rn 's/^((https?|all)_proxy)/export \1/p')"
	fi
}
