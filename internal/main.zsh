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

if ! core::exists curl; then core::install curl; fi
if ! core::exists gpg; then core::install gpg; fi
rvm::internal::rvm::load
if ! core::exists rvm; then rvm::internal::rvm::install; fi

