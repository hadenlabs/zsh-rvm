#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install rvm for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

ZSH_RVM_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_RVM_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_RVM_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_RVM_PATH}"/pkg/main.zsh
