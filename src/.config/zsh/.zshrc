fpath+=~/.zfunc

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

zstyle ':completion:*:*:make:*' tag-order 'targets'
autoload -U compinit; compinit

setopt inc_append_history
setopt hist_ignore_dups
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

export CLICOLOR=1;
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export TERM="xterm-256color"

if [ -n "$SSH_CONNECTION" ]; then
    export IS_REMOTE="1"
else
    export IS_REMOTE="0"
fi

get_appearance() {
  if [[ "$IS_REMOTE" == "1" ]]; then
    echo "light"   # Always use light theme over SSH (or change to "dark" if desired)
  elif [[ "$(uname)" == "Darwin" ]]; then
    interface_style=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
    if [[ "$interface_style" == "Dark" ]]; then
      echo "dark"
    else
      echo "light"
    fi
  else
    echo "light"  # Fallback
  fi
}

# Load the appropriate tmux theme
export THEME_STYLE=$(get_appearance)

[ -f "$HOME/.path" ] && source "$HOME/.path"

export SHELL="$(command -v zsh)"

if command -v nvim 2>&1 >/dev/null; then
    export EDITOR="$(command -v nvim)";
    export MANPAGER="nvim +Man!";
else
    echo "nvim could not be found"
fi

if command -v arc 2>&1 >/dev/null; then
    alias arc-cap="arc add -A; arc commit --amend --no-edit; arc push --force"
fi

if command -v git 2>&1 >/dev/null; then
    alias git-st="git status"
    alias git-co="git checkout"
else
    echo "git could not be found"
fi

if command -v lsd 2>&1 >/dev/null; then
    alias ls="lsd --group-dirs=first"
    alias ll="lsd -1 --blocks permission,links,user,group,size,date,git,name --date '+%d.%m.%y %H:%M:%S' --group-dirs=first"
    alias la="ls -A"
    alias lla="ll -A"
else
    echo "lsd could not be found"
fi

if command -v tree 2>&1 >/dev/null; then
    alias lst="tree --gitignore"
    alias lat="tree -a --gitignore -I .git"
    alias lstd="lst -L"
    alias latd="lat -L"
else
    echo "tree could not be found"
fi

if command -v safe-rm 2>&1 >/dev/null; then
    alias rm="safe-rm"
else
    echo "safe-rm could not be found"
fi

if command -v tmux 2>&1 >/dev/null; then
    alias ta="tmux attach"
    alias ts="tmux list-sessions"
else
    echo "tmux could not be found"
fi

if command -v fzf 2>&1 >/dev/null; then
    source <(fzf --zsh)
    if [[ $THEME_STYLE == "dark" ]]; then
        export FZF_DEFAULT_OPTS='--color=dark'
    else
        export FZF_DEFAULT_OPTS='--color=light'
    fi
else
    echo "fzf could not be found"
fi

printf "\\033]2;$(whoami)@$(hostname)\\007"

plugins="$ZDOTDIR/plugins"
source "$plugins/zsh-vi-mode/zsh-vi-mode.zsh"
source "$plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
eval "$(starship init zsh)"
