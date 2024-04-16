#!/bin/bash

[[ -z $__ENV_LIB_JAVA ]] && __ENV_LIB_JAVA=1 || return

readonly MVN_REPOSITORY=~/.m2/repository

source "$ENV/lib/bash/fs.sh"

run-artifact() {
    if (($# < 3)); then
        echo "Invalid arguments:" "$@"
        return 1
    fi

    local artifact
    artifact="$(find-artifact "${@:1:3}")"

    shift 3
    java -jar "$artifact" "$@"
}

find-artifact() {
    local groupId=$1
    local artifactId=$2
    local version=$3

    if [[ -z $groupId || -z $artifactId || -z $version ]]; then
        echo "Invalid arguments:" "$@"
        return 1
    fi

    local directory=$MVN_REPOSITORY/${groupId//./\/}/$artifactId/$version
    local artifact=$directory/$artifactId-$version.jar

    if [[ ! -e $artifact ]] || (
        [[ $version = *-SNAPSHOT ]] && fd -Fqd1 --changed-before 1week resolver-status.properties "$directory"
    ); then
        download-artifact "${@:1:3}" || return 1
    fi

    echo "$artifact"
}

download-artifact() (
    local groupId=$1
    local artifactId=$2
    local version=$3

    if [[ -z $groupId || -z $artifactId || -z $version ]]; then
        echo "Invalid arguments:" "$@"
        return 1
    fi

    echo "Downloading $groupId:$artifactId:$version ..." >&2

    local directory
    create-temp-directory directory
    cd "$directory" || return 1

    cat >pom.xml <<END
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.github.moonfruit</groupId>
    <artifactId>maven-downloader</artifactId>
    <version>1.0.0-SNAPSHOT</version>
    <dependencies>
        <dependency>
            <groupId>$groupId</groupId>
            <artifactId>$artifactId</artifactId>
            <version>$version</version>
        </dependency>
    </dependencies>
</project>
END

    mvn -q compile
)
