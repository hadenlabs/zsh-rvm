#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install zsh for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

PACKAGE_NAME=rvm

plugin_dir=$(dirname "${0}":A)
# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/messages.zsh

function rvm::install {
    message_info "Installing ${PACKAGE_NAME}"
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable
    rvm::custom
    message_success "Installed ${PACKAGE_NAME}"
}

function rvm::custom {
    if [[ -x "$(command which rvm)" ]]; then
        message_info "Installing ruby ${PACKAGE_NAME}"
        rvm install 2.5.3
        rvm use 2.5.3 --default
        message_success "Installed ${PACKAGE_NAME}"
    fi
}

function rvm::post_install {
    if [[ -x "$(command which ruby)" ]]; then
        message_info "Installing gems ${PACKAGE_NAME}"
        gem install tmuxinator \
            cocoapods
        message_success "Installed ${PACKAGE_NAME}"
    fi
}

function rvm::init {
    # Add RVM to PATH for scripting
    [[ -e "${HOME}/.rvm/bin" ]] && export PATH="${PATH}:${HOME}/.rvm/bin"
    [[ -e "/usr/local/rvm/bin" ]] && export PATH="${PATH}:/usr/local/rvm/bin"
}

rvm::init

if [[ ! -x "$(command which rvm)" ]]; then
    rvm::install
    rvm::post_install
fi
