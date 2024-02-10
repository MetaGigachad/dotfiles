#!/usr/bin/env bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$script_dir/common/check_env.sh"
source "$script_dir/common/logging.sh"

install_kitty() {
    if [ -d "$XDG_CONFIG_HOME/kitty" ]; then
        info "Kitty config already installed\n"
        return
    fi
    info "Installing kitty config"
    ln -sf "$PWD/../src/.config/kitty" "$XDG_CONFIG_HOME/kitty"
}

cd "$script_dir"

check_env
install_kitty

print_success "Extras installation is complete!"

