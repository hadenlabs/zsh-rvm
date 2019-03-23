#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install zsh for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

LIGHT_GREEN='\033[1;32m'
GREEN='\033[0;32m'
CLEAR='\033[0m'

function rvm::install {
    echo -e "${CLEAR}${LIGHT_GREEN}Installing RVM${CLEAR}"
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable
    rvm::custom
}

function rvm::custom {
    if (( $+commands[rvm] )); then
        echo -e "${CLEAR}${LIGHT_GREEN} Install Ruby ${CLEAR}"
        rvm install 2.5.3
        rvm use 2.5.3 --default
        echo -e "${CLEAR}${LIGHT_GREEN}Installing required packages${CLEAR}"
        gem install tmuxinator
    fi
}

function rvm::init {
    # Add RVM to PATH for scripting
    [[ -e "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"
    [[ -e "/usr/local/rvm/bin" ]] && export PATH="$PATH:/usr/local/rvm/bin"
}

rvm::init

if (( ! $+commands[rvm] )); then
    rvm::install
fi
