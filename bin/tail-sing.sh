#!/usr/bin/env bash
tail -F /tmp/moonfruit.sing.std{out,err} | rg -v www.gstatic.com
