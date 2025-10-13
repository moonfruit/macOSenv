#!/bin/bash
#tail -F /tmp/moonfruit.sing.std{out,err} | rg -v ' dns: | inbound/direct\[dns-in]: connection closed: '
exec tail -F /tmp/moonfruit.sing.std{out,err}
