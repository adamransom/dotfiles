export PATH=/opt/subversion/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:~/android-sdk-macosx/tools/:~/android-sdk-macosx/platform-tools/
export PATH=$PATH:~/bin
export GREP_OPTIONS='--color=auto'

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

alias g="mvim --remote-silent"
alias rspec="rspec --color --format progress"

function parse_git_branch
{
  branch=$(git branch 2> /dev/null | awk "{print \$2}")
  if [ "$branch" != "" ]; then
    echo "(${branch})";
  fi
}

if [ $(tput colors) == "256" ]; then
  PS1="\[\033[38;5;125m\]\w\[\033[0;34m\]\$(parse_git_branch) \[\033[0;0m\]\$ "
else
  PS1="\[\033[0;35m\]\w\[\033[0;34m\]\$(parse_git_branch) \[\033[0;0m\]\$ "
fi

set -o vi
