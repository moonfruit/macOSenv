#!/usr/bin/env bash
# Verify a PGP passphrase against an ASCII-armored private key file
# without touching the user's existing GnuPG keyring.

set -euo pipefail

usage() {
    cat <<EOF
Usage: ${0##*/} [-f KEYFILE] [-k KEYID]

Options:
  -f KEYFILE   Path to ASCII-armored private key file (default: ./secrets.asc)
  -k KEYID     Specific key ID / fingerprint to verify (default: prompt)
  -h           Show this help

Imports the key into a throwaway GNUPGHOME, prompts for the passphrase
without echoing it, and tries to sign a test payload. Exits 0 on success,
1 on wrong passphrase, 2 on usage / setup errors.
EOF
}

KEYFILE="./secrets.asc"
KEYID=""

while getopts ":f:k:h" opt; do
    case "$opt" in
        f) KEYFILE="$OPTARG" ;;
        k) KEYID="$OPTARG" ;;
        h) usage; exit 0 ;;
        *) usage >&2; exit 2 ;;
    esac
done

[[ -r "$KEYFILE" ]] || { echo "Error: cannot read key file: $KEYFILE" >&2; exit 2; }
command -v gpg >/dev/null || { echo "Error: gpg not found in PATH" >&2; exit 2; }

# Use /tmp to keep the path short — macOS limits Unix domain socket paths
# to ~104 bytes (sockaddr_un.sun_path), and gpg-agent puts its socket
# inside GNUPGHOME by default. The default $TMPDIR on macOS
# (/var/folders/.../T/) blows past that limit.
TMP_GNUPGHOME=$(TMPDIR=/tmp mktemp -d -t verify-pgp-pass.XXXXXX)
chmod 700 "$TMP_GNUPGHOME"
# shellcheck disable=SC2317  # invoked via `trap cleanup EXIT`
cleanup() {
    gpgconf --homedir "$TMP_GNUPGHOME" --kill all 2>/dev/null || true
    rm -rf "$TMP_GNUPGHOME"
}
trap cleanup EXIT

export GNUPGHOME="$TMP_GNUPGHOME"

gpg --batch --quiet --import "$KEYFILE" \
    || { echo "Error: failed to import $KEYFILE" >&2; exit 2; }

if [[ -z "$KEYID" ]]; then
    echo "Secret keys found in $KEYFILE:"
    KEYIDS=()
    while IFS= read -r kid; do
        KEYIDS+=("$kid")
    done < <(gpg --list-secret-keys --with-colons | awk -F: '$1=="sec"{print $5}')

    [[ ${#KEYIDS[@]} -gt 0 ]] || { echo "Error: no secret keys found" >&2; exit 2; }

    i=1
    for kid in "${KEYIDS[@]}"; do
        uid=$(gpg --list-secret-keys --with-colons "$kid" \
              | awk -F: '$1=="uid"{print $10; exit}')
        printf "  %d) %s  %s\n" "$i" "$kid" "$uid"
        i=$((i+1))
    done

    read -rp "Select key [1-${#KEYIDS[@]}]: " choice
    if ! [[ "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice > ${#KEYIDS[@]} )); then
        echo "Invalid choice" >&2
        exit 2
    fi
    KEYID="${KEYIDS[$((choice-1))]}"
fi

read -rsp "Passphrase for $KEYID: " PASSPHRASE
echo

if printf 'verify-passphrase-test' | gpg --batch --quiet --no-tty \
        --pinentry-mode loopback \
        --passphrase "$PASSPHRASE" \
        --local-user "$KEYID" \
        --sign --output /dev/null 2>/dev/null; then
    echo "OK: passphrase is correct for key $KEYID"
    exit 0
else
    echo "FAIL: passphrase is INCORRECT for key $KEYID" >&2
    exit 1
fi
