#!/usr/bin/env bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$script_dir/common/check_env.sh"
source "$script_dir/common/logging.sh"

clean_tmux() {
    info "Cleaning tmux config"
    rm -rf "$HOME/.tmux"
    rm "$XDG_CONFIG_HOME/tmux"
    rm "$HOME/.tmux.conf"
}

clean_zsh() {
    info "Cleaning zsh config"
    rm -rf "$PWD/../src/.config/zsh/plugins"
    rm "$HOME/.zshenv"
    rm "$XDG_CONFIG_HOME/zsh"
}

clean_nvim_config() {
    info "Cleaning neovim config"
    rm -rf "$XDG_CONFIG_HOME/nvim"
}

clean_starship() {
    info "Cleaning starship config"
    rm -f "$XDG_CONFIG_HOME/starship.toml"
}

clean_ssh() {
    info "Cleaning ssh config"
    rm -f "$HOME/.ssh/rc"
}

cd "$script_dir"

check_env
clean_tmux
clean_ssh
clean_zsh
clean_nvim_config
clean_starship

print_success "Cleaning is complete!"

