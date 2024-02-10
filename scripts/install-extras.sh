#!/usr/bin/env bash

set -e

check_env() {
    if [ -z "$HOME" ]; then
        printf 'Please set HOME\n'
        exit
    fi
    if [ -z "$XDG_CONFIG_HOME" ]; then
        export XDG_CONFIG_HOME="$HOME/.config"
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

