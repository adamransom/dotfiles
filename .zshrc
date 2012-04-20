# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="adamransom"

# Aliases
source $HOME/.aliases.sh
alias zshconf="mvim -v $HOME/.zshrc"
alias zshsource="source $HOME/.zshrc"

# Navigate to current project easily
function prj()
{
  if [ ! -n "$1" ]; then
    cd $HOME/projects/ppprails/src
  else
    cd $HOME/projects/"$1"
  fi
}

# Disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Load plugins
plugins=(git)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh
