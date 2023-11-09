#!/usr/bin/env bash

set -e

check_env() {
    if [ -z "$XDG_CONFIG_HOME" ]; then
        printf 'Please set XDG_CONFIG_HOME\n'
        exit
    fi
}

install_kitty() {
    if [ -d "$XDG_CONFIG_HOME/kitty" ]; then
        printf 'Kitty already installed\n'
        return
    fi
    ln -sf "$PWD/../src/.config/kitty" "$XDG_CONFIG_HOME/kitty"
}

cd "$(dirname "$0")"

install_kitty
