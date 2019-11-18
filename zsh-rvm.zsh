#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install zsh for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

package_name=rvm

plugin_dir=$(dirname "${0}":A)
# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/messages.zsh

function rvm::install {
    message_info "Installing ${package_name}"

    if [ -x "$(command which gpg)" ]; then
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    fi

    if [ -x "$(command which gpg2)" ]; then
        gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    fi

    curl -sSL https://get.rvm.io | bash -s stable

    rvm::custom
    message_success "Installed ${package_name}"
}

function rvm::custom {
    if [ -e "${HOME}/.rvm" ]; then
        rmv::init
        message_info "Installing ruby ${package_name}"
        rvm install 2.5.3
        rvm use 2.5.3 --default
        message_success "Installed ${package_name}"
    fi
}

function rvm::post_install {
    if [ -x "$(command which ruby)" ]; then
        message_info "Installing gems ${package_name}"
        gem install tmuxinator \
            cocoapods \
            terminal-notifier
        message_success "Installed ${package_name}"
    fi
}

function rvm::init {
    # Add RVM to PATH for scripting
    [[ -e "${HOME}/.rvm/bin" ]] && export PATH="${PATH}:${HOME}/.rvm/bin"
    [[ -e "/usr/local/rvm/bin" ]] && export PATH="${PATH}:/usr/local/rvm/bin"
}

rvm::init

if [ ! -e "${HOME}/.rvm" ]; then
    rvm::install
    rvm::post_install
fi
