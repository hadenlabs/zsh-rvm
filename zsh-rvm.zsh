#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install rvm for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

# shellcheck disable=SC2034  # Unused variables left for readability
RVM_ROOT="${HOME}"/.rvm
RVM_ROOT_DIR=$(dirname "$0")
RVM_SRC_DIR="${RVM_ROOT_DIR}"/src
RVM_CACHE_DIR="${HOME}/.cache/rvm"
RVM_ASYNC_NAME="rvm_worker"

export RVM_PACKAGE_NAME=rvm


# shellcheck source=/dev/null
source "${RVM_SRC_DIR}"/base.zsh

# shellcheck source=/dev/null
source "${RVM_SRC_DIR}"/utils.zsh

# shellcheck source=/dev/null
source "${RVM_SRC_DIR}"/async.zsh

rvm::init

if [ ! -e "${RVM_ROOT}" ]; then
    rvm::install
fi
