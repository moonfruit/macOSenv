#!/bin/bash
set -eu

BIN=$(dirname "${BASH_SOURCE[0]}")

echo "==> Clear apt"
sudo du -sh /var/cache/apt
echo ---
sudo apt autoremove -y
sudo apt clean
echo ---
sudo du -sh /var/cache/apt

if command -v brew >/dev/null; then
    echo
    echo "==> Clear brew"
    HOMEBREW_CACHE=$(brew --cache)
    du -sh "$HOMEBREW_PREFIX" "$HOMEBREW_CACHE"
    echo ---
    brew autoremove
    brew cleanup --prune=all -s
    GIT=git
    if [[ -x "$BIN/gitr" ]]; then
        GIT="$BIN/gitr"
    fi
    cd "$HOMEBREW_PREFIX" && "$GIT" gc
    echo ---
    du -sh "$HOMEBREW_PREFIX" "$HOMEBREW_CACHE"
fi

if command -v snap >/dev/null; then
    echo
    echo "==> Clear snap"
    du -sh /var/lib/snapd/snaps
    echo ---
    snap list --all | awk '/disabled|已禁用/{print $1, $3}' |
        while read snapname revision; do
            echo "removing $snapname $revision"
            sudo snap remove "$snapname" --revision="$revision"
        done
    echo ---
    du -sh /var/lib/snapd/snaps
fi

echo
echo "==> Clear systemd"
sudo journalctl --disk-usage
echo ---
sudo journalctl --vacuum-time=1d
echo ---
sudo journalctl --disk-usage

[[ -x ~/.iterm2/it2attention ]] && ~/.iterm2/it2attention start
