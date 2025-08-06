#!/usr/bin/env bash
tar -czf gpg-backup.tar.gz -C ~ \
    --exclude='.gnupg/*.lock' \
    --exclude='.gnupg/*.sock' \
    --exclude='.gnupg/S.*' \
    --exclude='.gnupg/*.log' \
    --exclude='.gnupg/*.tty' \
    --exclude='.gnupg/.*' \
    --exclude='.gnupg/*~' \
    .gnupg
