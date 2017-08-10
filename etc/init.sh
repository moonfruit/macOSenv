#!/usr/bin/env bash
cd ~ || exit 1
ln -sf Documents/Environment/etc/bashrc .bash_profile
ln -sf Documents/Environment/etc/colorsvnrc .colorsvnrc
ln -sf Documents/Environment/etc/git/gitconfig .gitconfig
ln -sf Documents/Environment/etc/git/gitignore .gitignore
ln -sf Documents/Environment/etc/subversion .subversion
ln -sf Documents/Environment/etc/vim .vim
ln -sf Documents/Environment/etc/zshrc .zshrc

mkdir -p .ssh
cd .ssh || exit 1
ln -sf ../Documents/Environment/etc/ssh/config

cd /usr/local/etc || exit 1
ln -sf ~/Documents/Environment/etc/proxychains.conf
ln -sf ~/Documents/Environment/etc/shadowsocks-libev.json
