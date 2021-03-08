#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function rvm::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_RVM_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_RVM_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_RVM_PATH}"/config/linux.zsh
      ;;
    esac
}

rvm::config::main::factory
