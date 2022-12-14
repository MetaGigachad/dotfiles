#!/bin/bash

shopt -s dotglob
dir="$PWD"

symlink-all() {
    local origin="$1"
    local destination="$2"

    cd $origin
    for target in *
    do
        rm -rf "$destination/$target"
        ln -s "$PWD/$target" "$destination/$target"
    done
    cd $dir
}

symlink-all home "$HOME"
symlink-all config "$XDG_CONFIG_HOME"
symlink-all data "$XDG_DATA_HOME"
symlink-all bin "$HOME/.local/bin"
