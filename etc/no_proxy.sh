#!/usr/bin/env bash

printf -v no_proxy ',%s' 10.1.{2..3}.{1..254}
export no_proxy="localhost,.gingkoo,127.0.0.1${no_proxy}"
# printf -v no_proxy_append ',%s' 192.168.1.{1..254}
# export no_proxy="${no_proxy}${no_proxy_append}"
# printf -v no_proxy_append ',%s' 192.168.31.{1..254}
# export no_proxy="${no_proxy}${no_proxy_append}""
