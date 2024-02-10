#!/usr/bin/env bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$script_dir/common/check_env.sh"
source "$script_dir/common/logging.sh"

clean_kitty() {
    info "Cleaning kitty config"
    rm "$XDG_CONFIG_HOME/kitty"
}

cd "$script_dir"

check_env
clean_kitty

print_success "Extras cleaning is complete!"

