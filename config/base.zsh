#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export RVM_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export RVM_PACKAGE_NAME=rvm
export RVM_ROOT="${HOME}"/.rvm
export RVM_CACHE_DIR="${HOME}/.cache/rvm"
export RVM_VERSIONS=(
    2.7.0
)
export RVM_VERSION_GLOBAL=2.7.0
export RVM_PACKAGES=(
    tmuxinator
    cocoapods
    terminal-notifier
    solargraph
)
