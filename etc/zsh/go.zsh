#!/usr/bin/env bash

export GOPATH="$WORKSPACE/go"
hash -d GOPATH="$GOPATH"

export PATH="$GOPATH/bin:$PATH"

GO_MOON="$GOPATH/src/github.com/moonfruit"
hash -d GO_MOON="$GO_MOON"
GO_PENTA="$GOPATH/src/github.com/pentaglobal"
hash -d GO_PENTA="$GO_PENTA"

GO_ETH="$GOPATH/src/github.com/ethereum/go-ethereum"
hash -d GO_ETH="$GO_ETH"
