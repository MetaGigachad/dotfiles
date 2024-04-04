#!/usr/bin/env sh

set -e

apk add --no-cache sudo git curl bash zsh tree tmux man-db neovim

cd /tmp

curl -O https://starship.rs/install.sh && sh ./install.sh -y

curl -L https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd-v1.1.2-x86_64-unknown-linux-musl.tar.gz \
    | tar xzv -C /usr/local/bin --strip-components 1

NEWUSER=dev
adduser -D $NEWUSER && echo "$NEWUSER:$NEWUSER" | chpasswd
echo "$NEWUSER ALL=(ALL) ALL" > /etc/sudoers.d/$NEWUSER && chmod 0440 /etc/sudoers.d/$NEWUSER

su - dev <<EOF
mkdir -p /home/dev/git && cd /home/dev/git
git clone https://github.com/MetaGigachad/nano-dotfiles.git
./nano-dotfiles/scripts/install.sh -y
EOF

