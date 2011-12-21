export PATH=/opt/subversion/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:~/android-sdk-macosx/tools/:~/android-sdk-macosx/platform-tools/

alias g="mvim --remote-silent"

function parse_git_branch
{
  branch=$(git branch 2> /dev/null | awk "{print \$2}")
  if [ "$branch" != "" ]; then
    echo "(${branch})";
  fi
}

PS1="\033[0;35m\w \033[0;34m\$(parse_git_branch) \033[0;0m"
