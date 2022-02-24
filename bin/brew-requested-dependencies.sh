#!/bin/bash
brew info --json=v2 --installed | \
	jq -r '.formulae | map(select('`
		`'(.installed | length > 1)'`
		`' or (.installed[0] | (.installed_on_request and .installed_as_dependency))'`
		`')) | .[].name'
