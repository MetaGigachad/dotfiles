fpath+=~/.zfunc

zstyle ':completion:*:*:make:*' tag-order 'targets'
autoload -U compinit; compinit

setopt inc_append_history
setopt hist_ignore_dups

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export SHELL="zsh";
export CLICOLOR=1;
export EDITOR="nvim";
export MANPAGER="nvim +Man!";
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export TERM="xterm-256color"
export PATH="/opt/homebrew/bin:$PATH"
export IS_REMOTE="1"

if command -v lsd 2>&1 >/dev/null
then
    alias ls="lsd --group-dirs=first"
    alias ll="lsd -1 --blocks permission,links,user,group,size,date,git,name --date '+%d.%m.%y %H:%M:%S' --group-dirs=first"
    alias la="ls -A"
    alias lla="ll -A"
else
    echo "lsd could not be found"
fi

if command -v tree 2>&1 >/dev/null
then
    alias lst="tree --gitignore"
    alias lat="tree -a --gitignore -I .git"
    alias lstd="lst -L"
    alias latd="lat -L"
else
    echo "tree could not be found"
fi

if command -v safe-rm 2>&1 >/dev/null
then
    alias rm="safe-rm"
else
    echo "safe-rm could not be found"
fi

if command -v arc 2>&1 >/dev/null
then
    arc-diff() {
        nvim -d <(arc show HEAD:$1) $1
    }
fi

if command -v tmux 2>&1 >/dev/null
then
    alias ta="tmux attach"
    alias ts="tmux list-sessions"
fi

printf "\\033]2;$(whoami)@$(hostname)\\007"

[ -f "$HOME/.path" ] && source "$HOME/.path"
plugins="$ZDOTDIR/plugins"
source "$plugins/zsh-vi-mode/zsh-vi-mode.zsh"
source "$plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
eval "$(starship init zsh)"
