#!/bin/sh
exec sed -E 's|\x1b\[90m|\x1b[92m|g'
