#!/usr/bin/env bash

OLD="${1:-python@3.12}"
NEW="${2:-${1:-python@3.13}}"

brew info --json=v2 --installed | \
    jq -r '.formulae[]
        | select((.dependencies[] == "'"$NEW"'")
            and (.installed[].runtime_dependencies[].full_name == "'"$OLD"'"))
        | .full_name'
