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

if ! core::exists curl; then rvm::internal::curl::install; fi
if ! core::exists rvm; then rvm::internal::rvm::install; fi
