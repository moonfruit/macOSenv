#!/usr/bin/env bash
#
# mvn-release.sh - interactive front-end for the Maven Release Plugin.
#
# Reads the current project version, derives the release version and the next
# development version, asks for confirmation, then runs `release:prepare`.
#
# Only requires bash and mvn. Written for bash 3.2, so the /bin/bash shipped
# with macOS works as well.
#
# Environment:
#   MVN            maven executable            (default: mvn)
#   RELEASE_SUFFIX suffix of release versions  (default: -RELEASE, may be empty)

set -euo pipefail

readonly PROGRAM=${0##*/}
readonly SNAPSHOT_SUFFIX='-SNAPSHOT'

MVN=${MVN:-mvn}
RELEASE_SUFFIX=${RELEASE_SUFFIX--RELEASE}

usage() {
    cat <<EOF
Usage: $PROGRAM [options] [-- <extra mvn arguments>]

Options:
  -r, --release <version>  release version       (default: derived, asked interactively)
  -d, --develop <version>  next development version
  -t, --tag <tag>          git tag               (default: the release version)
  -y, --yes                accept the defaults instead of asking
  -n, --dry-run            print the maven commands without running them
  -h, --help               show this help

Any argument that is not listed above, or anything after --, is passed on to
\`mvn release:prepare\`, e.g. \`$PROGRAM -y -Darguments=-DskipTests\`.
EOF
}

die() {
    printf '%s: %s\n' "$PROGRAM" "$*" >&2
    exit 1
}

# Emit "==> <message>" in bold green when stdout is a terminal.
info() {
    if [ -t 1 ] && command -v tput >/dev/null 2>&1; then
        printf '%s==>%s %s%s%s\n' \
            "$(tput setaf 2)" "$(tput sgr0)" "$(tput bold)" "$*" "$(tput sgr0)"
    else
        printf '==> %s\n' "$*"
    fi
}

# Append $2 to $1 unless it is already there.
with_suffix() {
    case $1 in
        '' | *"$2") printf '%s' "$1" ;;
        *) printf '%s%s' "$1" "$2" ;;
    esac
}

# Derive DEFAULT_RELEASE/DEFAULT_DEVELOP from the current version.
#
# A trailing zero patch level is treated as the start of a minor series, so
# 1.2.0-SNAPSHOT is released as 1.2.0 and development continues on 1.3.0;
# 1.2.3-SNAPSHOT is released as 1.2.3 and continues on 1.2.4.
derive_versions() {
    local version=$1 major minor patch
    local snapshot_re='^([0-9]+)\.([0-9]+)(\.([0-9]+))?-SNAPSHOT$'

    DEFAULT_RELEASE=$(with_suffix "${version%"$SNAPSHOT_SUFFIX"}" "$RELEASE_SUFFIX")
    DEFAULT_DEVELOP=

    if [[ $version =~ $snapshot_re ]]; then
        major=${BASH_REMATCH[1]}
        minor=${BASH_REMATCH[2]}
        patch=${BASH_REMATCH[4]}

        if [ -z "$patch" ]; then
            DEFAULT_DEVELOP=$major.$((minor + 1))
        elif [ "$((10#$patch))" -gt 0 ]; then
            DEFAULT_DEVELOP=$major.$minor.$((10#$patch + 1))
        else
            DEFAULT_DEVELOP=$major.$((minor + 1)).0
        fi
        DEFAULT_DEVELOP=$DEFAULT_DEVELOP$SNAPSHOT_SUFFIX
    fi
}

# ask <label> <preset> <default> <suffix>
#
# Echo <preset> if it is set, else ask for a version, else fall back to
# <default>. The result always carries <suffix>.
ask() {
    local label=$1 answer=$2 default=$3 suffix=$4

    if [ -z "$answer" ] && [ "$ASSUME_YES" = no ] && [ -t 0 ]; then
        if [ -n "$default" ]; then
            read -r -p "$label ($default): " answer || true
        else
            while [ -z "$answer" ]; do
                read -r -p "$label: " answer || true
            done
        fi
    fi

    if [ -z "$answer" ]; then
        [ -n "$default" ] || die "cannot derive the $label, pass it explicitly"
        answer=$default
    fi

    with_suffix "$answer" "$suffix"
}

run() {
    info "$*"
    [ "$DRY_RUN" = yes ] || "$@"
}

RELEASE=
DEVELOP=
TAG=
ASSUME_YES=no
DRY_RUN=no

while [ $# -gt 0 ]; do
    case $1 in
        -r | --release) RELEASE=${2:?missing release version}; shift 2 ;;
        -d | --develop) DEVELOP=${2:?missing development version}; shift 2 ;;
        -t | --tag) TAG=${2:?missing tag}; shift 2 ;;
        -y | --yes) ASSUME_YES=yes; shift ;;
        -n | --dry-run) DRY_RUN=yes; shift ;;
        -h | --help) usage; exit 0 ;;
        --) shift; break ;;
        *) break ;;
    esac
done

command -v "$MVN" >/dev/null 2>&1 || die "$MVN not found in PATH"
[ -f pom.xml ] || die "no pom.xml in $PWD"

CURRENT=$("$MVN" -q -DforceStdout -Dexpression=project.version help:evaluate | tr -d '[:space:]')
[ -n "$CURRENT" ] || die 'cannot read project.version'
info "Current version: $CURRENT"

derive_versions "$CURRENT"
RELEASE=$(ask 'Release Version' "$RELEASE" "$DEFAULT_RELEASE" "$RELEASE_SUFFIX")
DEVELOP=$(ask 'Develop Version' "$DEVELOP" "$DEFAULT_DEVELOP" "$SNAPSHOT_SUFFIX")
[ -n "$TAG" ] || TAG=$RELEASE

run "$MVN" clean release:clean
run "$MVN" release:prepare \
    -Dtag="$TAG" -DreleaseVersion="$RELEASE" -DdevelopmentVersion="$DEVELOP" "$@"
run "$MVN" release:clean

printf '\a'
info "Released $RELEASE, now developing $DEVELOP"

# The two version commits and the tag are local until they are pushed, and a
# plain `git push` would leave the tag behind.
if [ "$DRY_RUN" = no ]; then
    info "Publish the release commits together with the $TAG tag:"
    printf '\n    git push --follow-tags\n\n'
fi
