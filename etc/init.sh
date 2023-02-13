#!/usr/bin/env bash
cd ~ || exit 1
ln -sf Documents/Environment/etc/bashrc .bash_profile
ln -sf Documents/Environment/etc/colorsvnrc .colorsvnrc
ln -sf Documents/Environment/etc/git/gitconfig .gitconfig
ln -sf Documents/Environment/etc/git/gitignore .gitignore
ln -sf Documents/Environment/etc/inputrc .inputrc
ln -sf Documents/Environment/etc/subversion .subversion
ln -sf Documents/Environment/etc/vim .vim
ln -sf Documents/Environment/etc/zshrc .zshrc
touch Documents/Environment/etc/aria2/aria2.session

mkdir -p ~/.ssh
cd ~/.ssh || exit 1
ln -sf ../Documents/Environment/etc/ssh/config

mkdir -p ~/.config
cd ~/.config || exit 1
for FILE in ../Documents/Environment/etc/config/*; do
	ln -sf "$FILE"
done

mkdir -p ~/.config/mpv
cd ~/.config/mpv || exit 1
ln -sf ../../Documents/Environment/preferences/mpv/mpv.conf

mkdir -p ~/Library/LaunchAgents
cd ~/Library/LaunchAgents || exit 1
ln -sf /Users/moon/Documents/Environment/etc/aria2/aria2.plist com.github.moonfruit.aria2.plist
ln -sf /Users/moon/Documents/Environment/etc/stunnel/stunnel.plist com.github.moonfruit.stunnel.plist

cd /opt/homebrew/etc || exit 1
ln -sf ~/Documents/Environment/etc/proxychains.conf
ln -sf ~/Documents/Environment/etc/shadowsocks-libev.json

cd /opt/homebrew/etc/stunnel || exit 1
ln -sf ~/Documents/Environment/etc/stunnel/stunnel.conf
