# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="adamransom"

# Disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Load plugins
plugins=(git)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# -- Custom Stuff -- #

# Aliases
source $HOME/.aliases.sh
alias zshconf="mvim -v $HOME/.zshrc"
alias zshsource="source $HOME/.zshrc"

# Override this in .zshrc.local
PROJECTS_ROOT="$HOME/Documents"

# Navigate to current project easily
function prj()
{
  if [ ! -n "$1" ]; then
    cd "$PROJECTS_ROOT"/"$PROJECTS_CUR"
  else
    cd "$PROJECTS_ROOT"/"$1"
  fi
}

# LS colors
export LSCOLORS=exfxcxdxbxegedabagacad

# Load local configurations
test -f $HOME/.zshrc.local && source $HOME/.zshrc.local
