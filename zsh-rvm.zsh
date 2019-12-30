#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install zsh for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

rvm_package_name=rvm

function rvm::install {
    message_info "Installing ${rvm_package_name}"

    if type -p gpg > /dev/null; then
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    fi

    if type -p gpg2 > /dev/null; then
        gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    fi

    curl -sSL https://get.rvm.io | bash -s stable

    rvm::custom
    message_success "Installed ${rvm_package_name}"
    rvm::post_install
}

function rvm::custom {
    if [ -e "${HOME}/.rvm" ]; then
        rmv::init
        message_info "Installing ruby ${rvm_package_name}"
        rvm install 2.5.3
        rvm use 2.5.3 --default
        message_success "Installed ${rvm_package_name}"
    fi
}

function rvm::post_install {
    if type -p ruby > /dev/null; then
        message_info "Installing gems ${rvm_package_name}"
        gem install tmuxinator \
            cocoapods \
            terminal-notifier
        message_success "Installed ${rvm_package_name}"
    fi
}

function rvm::init {
    # Add RVM to PATH for scripting
    path_append "${HOME}/.rvm/bin"
    path_append "/usr/local/rvm/bin"
}

rvm::init

if [ ! -e "${HOME}/.rvm" ]; then
    rvm::install
fi
