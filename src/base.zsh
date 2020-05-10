#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function rvm::install::gpg {
    if type -p gpg > /dev/null; then
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    fi

    if type -p gpg2 > /dev/null; then
        gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    fi

    command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    command curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
}

function rvm::init {
    # Add RVM to PATH for scripting
    [ -e "${HOME}/.rvm/bin" ] && export PATH="${PATH}:${HOME}/.rvm/bin"
    [ -e "/usr/local/rvm/bin" ] && export PATH="${PATH}:/usr/local/rvm/bin"
}

function rvm::post_install {
    if type -p ruby > /dev/null; then
        message_info "Installing gems ${RVM_PACKAGE_NAME}"
        gem install tmuxinator \
            cocoapods \
            terminal-notifier
        message_success "Installed ${RVM_PACKAGE_NAME}"
    fi
}

function rvm::install {
    message_info "Installing ${RVM_PACKAGE_NAME}"
    rvm::install::gpg

    curl -sSL https://get.rvm.io | bash -s stable
    rvm get stable

    rvm::custom
    message_success "Installed ${RVM_PACKAGE_NAME}"
    rvm::post_install
}

function rvm::custom {
    if [ -e "${HOME}/.rvm" ]; then
        rvm::init
        message_info "Installing ruby ${RVM_PACKAGE_NAME}"
        rvm install 2.5.3
        rvm install 2.7.0
        rvm use 2.7.0 --default
        message_success "Installed ${RVM_PACKAGE_NAME}"
        return
    fi
}
