#!/usr/bin/env bash

set -e

check_env() {
    if [ -z "$XDG_CONFIG_HOME" ]; then
        printf 'Please set XDG_CONFIG_HOME\n'
        exit
    fi
}

clean_tmux() {
    rm -rf "$HOME/.tmux"
    rm "$XDG_CONFIG_HOME/tmux"
    rm "$HOME/.tmux.conf"
}

clean_zsh() {
    rm -rf "$PWD/../src/.config/zsh/plugins"
    rm "$HOME/.zshenv"
    rm "$XDG_CONFIG_HOME/zsh"
}

clean_nvim_config() {
    rm -rf "$XDG_CONFIG_HOME/nvim"
}

clean_starship() {
    rm -f "$XDG_CONFIG_HOME/starship.toml"
}

clean_ssh() {
    rm -f "$HOME/.ssh/rc"
}

cd "$(dirname "$0")"

check_env
clean_tmux
clean_ssh
clean_zsh
clean_nvim_config
clean_starship

