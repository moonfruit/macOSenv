#!/bin/bash
DIR=$(dirname "${BASH_SOURCE[0]}")
PROXY="${DIR}/proxy"
AUTH="${DIR}/proxy.nopassword.auth"
AUTH=$("$ENV/bin/crypto.py" decrypt "$(cat "$AUTH")")

exec "$PROXY" sps --local-type=tcp \
	--local=127.0.0.1:9990 \
	--parent-service-type=http \
	--parent-type=tcp \
	--parent=127.0.0.1:9900 \
	--parent-auth="$AUTH"
