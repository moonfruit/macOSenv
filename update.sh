#!/usr/bin/env bash
set -euo pipefail

# shellcheck source=lib/bash/color.sh
source "$ENV/lib/bash/color.sh"

BREW=1
GC=
SKIP=()

OPTS=$(getopt -n "$0" -o bgs: -l gc,no-gc,brew,no-brew,skip: -- "$@")
eval set -- "$OPTS"
while true; do
    case "$1" in
    -g | --gc)
        GC=1
        shift
        ;;
    --no-gc)
        GC=
        shift
        ;;
    -b | --brew)
        BREW=1
        shift
        ;;
    --no-brew)
        BREW=
        shift
        ;;
    -s | --skip)
        SKIP+=("$2")
        shift 2
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "Internal error!"
        exit 1
        ;;
    esac
done

# Check if a directory path matches any skip pattern using backward matching
# Pattern examples:
#   sing-box         -> matches /any/path/sing-box or sing-box
#   etc/sing-box     -> matches /any/path/etc/sing-box or etc/sing-box
#   nvim/env         -> matches /any/path/nvim/env or nvim/env
matches_skip() {
    local dir="$1"
    local pattern

    for pattern in "${SKIP[@]}"; do
        # Exact match
        if [[ "$dir" == "$pattern" ]]; then
            return 0
        fi
        # Ends with /{pattern}
        if [[ "$dir" == *"/$pattern" ]]; then
            return 0
        fi
    done
    return 1
}

# Resolve the default branch of a module's origin (main / master / ...)
default_branch() {
    local module="$1"
    local branch

    # Prefer the symbolic ref recorded for origin/HEAD
    branch=$(git -C "$module" symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null) || true
    branch=${branch#origin/}
    if [[ -n $branch ]]; then
        echo "$branch"
        return 0
    fi

    # Fallback: ask the remote for its HEAD branch
    branch=$(git -C "$module" remote show origin 2>/dev/null |
        sed -n 's/.*HEAD branch: //p')
    if [[ -n $branch && $branch != "(unknown)" ]]; then
        echo "$branch"
        return 0
    fi

    # Last resort: pick whichever common branch exists on the remote
    local candidate
    for candidate in main master; do
        if git -C "$module" show-ref --verify --quiet "refs/remotes/origin/$candidate"; then
            echo "$candidate"
            return 0
        fi
    done

    return 1
}

rg submodule .gitmodules | sed 's/.*"\(.*\)".*/\1/' | sort |
    while read -r MODULE; do
        echo "-------- $MODULE --------"
        BRANCH=$(default_branch "$MODULE") || {
            warn "Cannot determine default branch for $MODULE, skipping"
            continue
        }
        git -C "$MODULE" checkout "$BRANCH"
        git -C "$MODULE" fetch --tags --prune --no-tags origin "$BRANCH"
        git -C "$MODULE" rebase "origin/$BRANCH"
        if [[ -n $GC ]]; then
            git -C "$MODULE" gc
        fi
    done

fd -tf update.sh | while read -r MODULE; do
    if [[ $MODULE == update.sh ]]; then
        continue
    fi
    DIR=${MODULE%/*}

    if [[ ${#SKIP[@]} -gt 0 ]] && matches_skip "$DIR"; then
        warn "Skipping $DIR"
        continue
    fi

    echo "-------- $DIR --------"
    (cd "$DIR" && ./update.sh)
done

if [[ -n $BREW ]]; then
    echo "-------- homebrew --------"
    brew-up.sh
    brew-livecheck.sh --parallel
fi
