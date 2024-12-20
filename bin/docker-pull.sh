#!/usr/bin/env bash
run() {
    echo "=== === $* === ==="
    "$@"
}

docker images | awk 'NR>1{print $1":"$2}' | grep -v oracle/database | xargs docker inspect |
    jq -r '.[] | "docker pull --platform \(.Os)/\(.Architecture) \(.RepoTags[0])"' |
    while read -r cmd; do
        run $cmd
    done

run docker image prune -f
