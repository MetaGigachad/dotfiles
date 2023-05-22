#!/usr/bin/zsh

source "$ZDOTDIR/env"
source "$ZDOTDIR/aliases"
source "$ZDOTDIR/vimode"

setopt INC_APPEND_HISTORY_TIME
autoload -U compinit; compinit
eval $(dircolors -b)

plugins="$XDG_DATA_HOME/zsh/plugins"
source "$plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

eval "$(starship init zsh)"
# colorscript -e panes

source "$plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
