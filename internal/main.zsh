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

if ! type -p rsync > /dev/null; then rvm::internal::rync::install; fi
if ! type -p tmux > /dev/null; then rvm::internal::rvm::install; fi
if ! type -p tmuxinator > /dev/null; then rvm::internal::tmuxinator::install; fi
rvm::internal::rvm::load
