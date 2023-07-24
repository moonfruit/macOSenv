#!/usr/bin/env bash

REPO=$HOME/.m2/repository/
DIR=$(pwd)
if [[ $DIR != $REPO* ]]; then
	echo "Not in $REPO" >&2
	exit 1
fi
DIR=${DIR#"$REPO"}

IFS="/" read -r -a PARTS <<<"$DIR"
JAR="${PARTS[-2]}-${PARTS[-1]}-sources.jar"

wget "https://repo1.maven.org/maven2/$DIR/$JAR" -O "$JAR"
