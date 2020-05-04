#!/usr/bin/env bash
http -fh http://10.1.2.32/plantuml/form text=@<(brew-analyze.py) | \
	sed -n 's|Location: /plantuml/uml|http://10.1.2.32/plantuml/svg|p'
