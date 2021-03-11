#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function rvm::dependences {
    message_info "Installing dependences for ${RVM_PACKAGE_NAME}"
    if ! type -p curl > /dev/null; then rvm::internal::curl::install; fi
    message_success "Installed dependences for ${RVM_PACKAGE_NAME}"
}

function rvm::install {
    rvm::internal::rvm::install
}

function rvm::load {
    rvm::internal::rvm::load
}

function rvm::post_install {
    message_info "Post Install ${RVM_PACKAGE_NAME}"
    message_success "Success Install ${RVM_PACKAGE_NAME}"
}

function rvm::upgrade {
    rvm::internal::rvm::upgrade
}

function rvm::package::all::install {
    rvm::internal::packages::install
}

function rvm::install::versions {
    rvm::internal::version::all::install
}

function rvm::install::version::global {
    rvm::internal::version::global::install
}
