#!/usr/bin/env bash
cd ~ || exit 1
ln -sf Documents/Environment/etc/bashrc .bash_profile
ln -sf Documents/Environment/etc/git/gitconfig .gitconfig
ln -sf Documents/Environment/etc/git/gitignore .gitignore
ln -sf Documents/Environment/etc/zshrc .zshrc

mkdir -p .ssh
cd .ssh || exit 1
ln -sf ../Documents/Environment/etc/ssh/config
