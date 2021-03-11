#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function rvm::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_RVM_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_RVM_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_RVM_PATH}"/internal/linux.zsh
      ;;
    esac
}

rvm::internal::main::factory
rvm::internal::rvm::load
if ! type -p rvm > /dev/null; then rvm::internal::rvm::install; fi
