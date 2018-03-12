#!/usr/bin/env zsh

export GOPATH="$WORKSPACE/go"
hash -d GOPATH="$GOPATH"

export PATH="$GOPATH/bin:$PATH"

export MYGO_HOME="$GOPATH/src/github.com/moonfruit"
