#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# shellcheck source=/dev/null
[ -e "${HOME}/.zsh-async/async.zsh" ] && source "${HOME}/.zsh-async/async.zsh"

# Define a function to process the result of the job
function rvm::async::completed::callback {
    message_success "${@}"
    async_stop_worker "${RVM_ASYNC_NAME}" -u
}

function rvm::async::init {
    if ! rvm::utils::callable "async_init" && ! rvm::utils::callable "async_start_worker"; then
        message_warning "not found library async"
        return
    fi

    async_init
    rvm::async::register_worker
}

function rvm::async::register_worker {
    # Start a worker that will report job completion
    async_start_worker "${RVM_ASYNC_NAME}" -u
    async_register_callback "${RVM_ASYNC_NAME}" rvm::async::completed::callback
}

rvm::async::init