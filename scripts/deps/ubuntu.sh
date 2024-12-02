#!/usr/bin/env bash

set -e

apt-get update -y && apt-get install -y sudo git curl zsh tree tmux man unzip safe-rm nodejs ripgrep

cd /tmp

curl -O https://starship.rs/install.sh && sh ./install.sh -y

curl -L https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd-musl_1.1.2_amd64.deb -o lsd.deb \
    && dpkg -i lsd.deb \
    && rm lsd.deb

curl -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz \
    | tar xzv -C /usr/local --strip-components 1