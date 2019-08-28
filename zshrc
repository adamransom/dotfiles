# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
  export PATH=''
  eval `/usr/libexec/path_helper -s`
fi

export PATH="/usr/local/bin:$PATH"

# if rbenv is present, configure it for use
if which rbenv &> /dev/null; then
  # put the rbenv entry at the front of the line
  export PATH="$HOME/.rbenv/bin:$PATH"

  # enable shims and auto-completion
  eval "$(rbenv init -)"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# General Aliases
alias v="mvim -v"
alias g="mvim --remote-silent"
alias ze="$EDITOR $HOME/.zshrc"
alias zs="source $HOME/.zshrc"
alias l="la" # overwrite prezto default

# Git Aliases
alias gs="git status" # overwrite prezto default
alias gl="git l" # overwrite prezto default
alias glm="gl master.."
alias gri="git rebase -i --autosquash master"
alias gsw="git switch"
alias gsc="git switch -c"

# Exports
export LSCOLORS=exfxcxdxbxegedabagacad

# Options
unsetopt CORRECT # no autocorrect thanks

# Load local configurations
test -f $HOME/.zshrc.local && source $HOME/.zshrc.local
