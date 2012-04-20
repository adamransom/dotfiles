# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="adamransom"

# Aliases
source ~/.aliases.sh

# Navigate to current project easily
function prj()
{
  if [ ! -n "$1" ]; then
    cd ~/projects/ppprails/src
  else
    cd ~/projects/"$1"
  fi
}

# Disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Load plugins
plugins=(git)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh
