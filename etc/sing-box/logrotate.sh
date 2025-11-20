#!/usr/bin/env bash

TEMP=$(mktemp -t logrotate)
trap 'rm -f "$TEMP"' EXIT

cat >"$TEMP" <<END
size 10M
rotate 2

compress
delaycompress

missingok
notifempty

dateext
dateformat -%Y%m%d-%s

create 0664 moon staff

/tmp/moonfruit.sing.stdout /tmp/moonfruit.sing.stderr {
    su root wheel
}
END

/opt/homebrew/sbin/logrotate -v "$TEMP"
