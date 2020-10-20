#!/usr/bin/env bash

brew outdated -v --greedy | rg -v 'alfred|datagrip|goland|google-chrome|intellij-idea|pycharm|steam|visual-studio-code'
