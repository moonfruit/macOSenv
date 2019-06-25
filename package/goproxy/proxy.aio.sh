#!/bin/bash
NO=$1
if [[ ! $NO =~ ^[0-9]+$ || $NO -gt 99 ]]; then
	echo "Invalid arguments"
	exit 1
fi

DIR=$(dirname "${BASH_SOURCE[0]}")
PROXY="${DIR}/proxy"
NO=$(printf %d "$NO")
NO2=$(printf %02d "$NO")
PASSWORD="${DIR}/proxy.aio.password"
PASSWORD=$("$ENV/bin/crypto.py" decrypt "$(cat "$PASSWORD")")

exec "$PROXY" sps --local-type=tcp \
	--local=127.0.0.1:98"$NO2" \
	--parent-service-type=ss \
	--parent-type=tcp \
	--parent-ss-key="$PASSWORD" \
	--parent=aio"$NO".hhservers.com:19966
