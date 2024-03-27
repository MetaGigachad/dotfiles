FROM ubuntu:22.04

RUN apt-get update -y && apt-get install -y curl
RUN curl -LO https://raw.githubusercontent.com/MetaGigachad/nano-dotfiles/main/docker/ubuntu_install.sh \
    && bash ubuntu_install.sh && rm ubuntu_install.sh

USER dev
WORKDIR /home/dev
ENTRYPOINT ["/bin/zsh"]

