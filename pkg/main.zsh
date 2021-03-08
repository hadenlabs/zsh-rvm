#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function rvm::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_RVM_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_RVM_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_RVM_PATH}"/pkg/linux.zsh
      ;;
    esac

    # shellcheck source=/dev/null
    source "${ZSH_RVM_PATH}"/pkg/helper.zsh

    # shellcheck source=/dev/null
    source "${ZSH_RVM_PATH}"/pkg/alias.zsh
}

rvm::pkg::main::factory
