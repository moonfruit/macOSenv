#!/usr/bin/env bash
set -e

CURRENT=$(mvn help:evaluate -q -DforceStdout -Dexpression=project.version)
if [[ $CURRENT =~ ^([0-9]+)\.([0-9]+)(\.[0-9]+)?-SNAPSHOT$ ]]; then
	MAJOR=${BASH_REMATCH[1]}
	MINOR=${BASH_REMATCH[2]}
	PATCH=${BASH_REMATCH[3]}
else
 	echo "Project version is not standard SNAPSHOT: $CURRENT" >&2
 	exit 1
fi

if [[ $PATCH ]]; then
	RELEASE=$MAJOR.$MINOR$PATCH-RELEASE
	DEVELOP=$MAJOR.$((MINOR+1)).0-SNAPSHOT
else
	RELEASE=$MAJOR.$MINOR-RELEASE
	DEVELOP=$MAJOR.$((MINOR+1))-SNAPSHOT
fi

echo "Release Version: $RELEASE"
read -rp "Develop Version ($DEVELOP): " NEXT
if [[ $NEXT ]]; then
	if [[ $NEXT == *-SNAPSHOT ]]; then
		DEVELOP=$NEXT
	else
		DEVELOP=$NEXT-SNAPSHOT
	fi
fi

mvn clean
mvn release:prepare -Dtag="$RELEASE" -DreleaseVersion="$RELEASE" -DdevelopmentVersion="$DEVELOP"
mvn release:clean
