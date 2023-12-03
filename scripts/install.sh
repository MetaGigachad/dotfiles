#!/usr/bin/env bash

set -e

check_env() {
    if [ -z "$XDG_CONFIG_HOME" ]; then
        printf 'Please set XDG_CONFIG_HOME\n'
        exit
    fi
}

install_tmux() {
    if [ -d "$XDG_CONFIG_HOME/tmux" ]; then
        printf 'Tmux already installed\n'
        return
    fi
    ln -sf "$PWD/../src/.config/tmux" "$XDG_CONFIG_HOME/tmux"
    git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"   
    printf 'Do not forget to install tmux\n'
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
            read reinstall
            [ "$reinstall" = "y" ] && rm -rf "$plugin" && git clone "${plugin_urls[$plugin]}" "$plugin"
        fi
    done
    cd "$original_path"
}

install_zsh() {
    if [ -d "$XDG_CONFIG_HOME/zsh" ]; then
        printf 'Zsh already installed\n'
        return
    fi
    ln -sf "$PWD/../src/.config/zsh" "$XDG_CONFIG_HOME/zsh"
    ln -sf "$PWD/../src/.zshenv" "$HOME/.zshenv"
    load_zsh_plugins
    printf 'Do not forget to install zsh, starship, lsd, tree\n'
}

install_nvim_config() {
    if [ -d "$XDG_CONFIG_HOME/nvim" ]; then
        printf 'Neovim config already installed\n'
        return
    fi
    git clone 'git@github.com:MetaGigachad/nvim.git' "$XDG_CONFIG_HOME/nvim"
    printf 'Do not forget to install neovim, pip, npm\n'
}

cd "$(dirname "$0")"

check_env
install_tmux
install_zsh
install_nvim_config

