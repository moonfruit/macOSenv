#!/usr/bin/env bash
URL=$(http -fh http://10.1.2.32/plantuml-v1/form text=@<(brew-analyze.py) |
	sed -n 's|Location: /plantuml-v1/uml|http://10.1.2.32/plantuml-v1/svg|p')
open "$URL"
