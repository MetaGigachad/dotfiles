# +------------------------+
# | XDG Base Directory spec|
# +------------------------+

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_PICTURES_DIR="$HOME/Pictures"
# export XDG_RUNTIME_DIR="$HOME/.local/runtime"

export PATH="$PATH:$HOME/Apps/VSCode-linux-x64"
export PATH="$PATH:/usr/local/texlive/2022/bin/x86_64-linux"
export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH="$PATH:/opt/sp_flash_tool/:/opt/sp_flash_tool/bin/"
export PATH="$PATH:$HOME/.cargo/bin/"
export PATH="$PATH:$HOME/.local/bin/statusbar/"
export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$HOME/games/Factorio/bin/x64/"
export PATH="$PATH:$XDG_DATA_HOME/JetBrains/Toolbox/scripts/"

source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/vimode.zsh"

setopt INC_APPEND_HISTORY_TIME
# +------------+
# | Completion |
# +------------+

autoload -U compinit; compinit
_comp_options+=(globdots)
source "$ZDOTDIR/completion.zsh"

# +--------+
# | Prompt |
# +--------+

#fpath=( "$ZDOTDIR/prompt" $fpath )
#autoload -U promptinit && promptinit
#prompt purity

# ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
ssh-add ~/.ssh/github_ed25519 &> /dev/null
ssh-add ~/.ssh/gitlab_ed25519 &> /dev/null

# Rust env vars
#export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
# export CARGO_HOME="$XDG_DATA_HOME/cargo"
# export PATH="$PATH:$CARGO_HOME/bin"

eval "$(starship init zsh)"

source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

colorscript -e panes

source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
