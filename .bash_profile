# set path variables
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:~/android-sdk-macosx/tools/:~/android-sdk-macosx/platform-tools/
export PATH=$PATH:~/bin

# colorize grep
export GREP_OPTIONS='--color=auto'

# colorize less (man)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# set up aliases
alias g="mvim --remote-silent"
alias rspec="rspec --color --format progress"
alias ls="ls -G"
alias ll="ls -al"
alias ..="cd .."

function prj()
{
  cd ~/projects/"$1"
}

# quick googling from command line
function goo()
{
  open "`echo \"http://www.google.com/search?q="$@"\"`"
}

# git aliases
alias gs="git status"
alias gss="git status -s"
alias gc="git commit -m"
alias gca="git commit -a -m"

# extract current git branch
function parse_git_branch
{
  branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
  if [ "$branch" != "" ]; then
    echo "${branch}";
  fi
}

# custom prompt with git branch
if [ $(tput colors) == "256" ]; then
  PS1="\[\033[38;5;125m\]\w\[\033[0;34m\]\$(parse_git_branch) \[\033[0;0m\]\$ "
else
  PS1="\[\033[0;35m\]\w\[\033[0;34m\]\$(parse_git_branch) \[\033[0;0m\]\$ "
fi

# set vi as command line editor (may switch back to emacs)
set -o vi
