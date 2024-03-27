FROM ubuntu:22.04

RUN apt-get update -y && apt-get install -y sudo git curl zsh tree tmux man ninja-build gettext cmake unzip build-essential

WORKDIR /tmp

RUN curl -O https://starship.rs/install.sh && sh ./install.sh -y

RUN curl -LO https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd-musl_1.1.2_amd64.deb && dpkg -i lsd-musl_1.1.2_amd64.deb

RUN curl -L https://github.com/neovim/neovim/archive/refs/tags/v0.9.5.tar.gz | tar xzv && \
    cd neovim-0.9.5 && make CMAKE_BUILD_TYPE=Release && make install

RUN yes | unminimize

RUN useradd -m -G sudo dev && echo "dev:dev" | chpasswd
USER dev

WORKDIR /home/dev/git/nano-dotfiles
COPY --chown=dev . .
RUN ./scripts/install.sh -y

WORKDIR /home/dev
ENTRYPOINT ["/bin/zsh"]
