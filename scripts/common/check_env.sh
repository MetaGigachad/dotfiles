#!/usr/bin/env bash

check_env() {
    if [ -z "$HOME" ]; then
        printf 'Please set HOME\n'
        exit
    fi
    if [ -z "$XDG_CONFIG_HOME" ]; then
        XDG_CONFIG_HOME="$HOME/.config"
    fi
}

