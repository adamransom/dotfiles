# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# General Aliases
alias v="mvim -v"
alias g="mvim --remote-silent"
alias zc="$EDITOR $HOME/.zshrc"
alias zs="source $HOME/.zshrc"
alias l="la" # overwrite prezto default

# Git Aliases
alias gs="git status" # overwrite prezto default
alias gl="git l" # overwrite prezto default

# Exports
export LSCOLORS=exfxcxdxbxegedabagacad

# Options
unsetopt CORRECT # no autocorrect thanks

# Load local configurations
test -f $HOME/.zshrc.local && source $HOME/.zshrc.local
