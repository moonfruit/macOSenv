#!/usr/bin/env bash
set -euo pipefail

get-port() {
    python3 <<END
import socket
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind(("127.0.0.1", 0))
    print(s.getsockname()[1])
END
}
PORT=$(get-port)
OUTBOUND=$(cat)

sing-box run -c /dev/stdin <<END &
{
  "inbounds": [
    {
      "type": "mixed",
      "tag": "mixed-in",
      "listen": "127.0.0.1",
      "listen_port": $PORT
    }
  ],
  "outbounds": [
    $OUTBOUND
  ]
}
END
PID=$!

until nc -z 127.0.0.1 "$PORT" 2>/dev/null; do
    sleep 0.1
done

curl -x "http://127.0.0.1:$PORT" -fsSL http://ipinfo.io | jq -r ".country" || RETURN_CODE=$?

kill $PID
wait $PID
exit "$RETURN_CODE"
