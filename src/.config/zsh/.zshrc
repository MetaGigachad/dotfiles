zstyle ':completion:*:*:make:*' tag-order 'targets'
autoload -U compinit; compinit

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export SHELL="zsh";
export CLICOLOR=1;
export EDITOR="nvim";
export MANPAGER="nvim +Man!";
export LANG=C.UTF-8
export LC_CTYPE=C.UTF-8
export TERM="xterm-256color"

alias ls="lsd -1 --blocks permission,name,date --date relative --group-dirs=first"
alias la="ls -A"
alias lst="tree --gitignore"
alias lat="lst -a -I .git"
alias lstd="lst -L"
alias latd="lat -L"

[ -f "$HOME/.path" ] && source "$HOME/.path"
plugins="$ZDOTDIR/plugins"
source "$plugins/zsh-vi-mode/zsh-vi-mode.zsh"
source "$plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
eval "$(starship init zsh)"
