#!/usr/bin/env bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$script_dir/common/check_env.sh"
source "$script_dir/common/logging.sh"

check_binaries() {
    info 'Checking installed binaries'
    dependecies=(tmux zsh lsd tree nvim pip npm starship)
    for item in "${dependecies[@]}"; do
        if ! command -v "$item" &> /dev/null; then
            warn "$item could not be found"
        fi
    done
}

install_tmux() {
    if [ -d "$XDG_CONFIG_HOME/tmux" ]; then
        info 'Tmux config already installed'
        return
    fi
    info 'Installing tmux config'
    ln -sf "$PWD/../src/.config/tmux" "$XDG_CONFIG_HOME/tmux"
    ln -sf "$XDG_CONFIG_HOME/tmux/tmux.conf" "$HOME/.tmux.conf"
    git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"   
}

load_zsh_plugins() {
    declare -A plugin_urls
    plugin_urls['zsh-autosuggestions']='https://github.com/zsh-users/zsh-autosuggestions.git'
    plugin_urls['zsh-syntax-highlighting']='https://github.com/zsh-users/zsh-syntax-highlighting.git'
    plugin_urls['zsh-vi-mode']='https://github.com/jeffreytse/zsh-vi-mode.git'

    plugins_dir="$XDG_CONFIG_HOME/zsh/plugins"
    [ ! -d "$plugins_dir" ] && mkdir -p "$plugins_dir"

    original_path="$(pwd)"
    cd "$plugins_dir"
    for plugin in "${!plugin_urls[@]}"
    do
        if [ ! -d "$plugin" ]; then
            git clone "${plugin_urls[$plugin]}" "$plugin"
        else
            echo "Plugin \"$plugin\" already exists. Reinstall it? [y/n]"
            read -r reinstall
            [ "$reinstall" = "y" ] && rm -rf "$plugin" && git clone "${plugin_urls[$plugin]}" "$plugin"
        fi
    done
    cd "$original_path"
}

install_zsh() {
    if [ -d "$XDG_CONFIG_HOME/zsh" ]; then
        info 'Zsh config already installed'
        return
    fi
    info 'Installing zsh config'
    ln -sf "$PWD/../src/.config/zsh" "$XDG_CONFIG_HOME/zsh"
    ln -sf "$PWD/../src/.zshenv" "$HOME/.zshenv"
    load_zsh_plugins
}

install_nvim_config() {
    if [ -d "$XDG_CONFIG_HOME/nvim" ]; then
        info 'Neovim config already installed'
        return
    fi
    info 'Installing neovim config'
    git clone 'https://github.com/MetaGigachad/nvim.git' "$XDG_CONFIG_HOME/nvim"
}

install_starship() {
    if [ -f "$XDG_CONFIG_HOME/starship.toml" ]; then
        info 'Starship already installed'
        return
    fi
    info 'Installing starship config'
    ln -sf "$PWD/../src/.config/starship.toml" "$XDG_CONFIG_HOME/"
}

install_ssh() {
    if [ -f "$HOME/.ssh/rc" ]; then
        info 'Ssh config already installed'
        return
    fi
    info 'Installing ssh config'
    ln -sf "$PWD/../src/.ssh/rc" "$HOME/.ssh/"
}

cd "$script_dir"

check_env
[ ! -d "$XDG_CONFIG_HOME" ] && mkdir -p "$XDG_CONFIG_HOME"
install_tmux
[ ! -d "$HOME/.ssh" ] && mkdir -p "$HOME/.ssh"
install_ssh
install_zsh
install_starship
install_nvim_config
check_binaries

print_success "Installation is complete!"

