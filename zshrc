export PATH="/usr/local/bin:$PATH"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# General Aliases
alias v='nvim'
alias ze="$EDITOR $HOME/.zshrc"
alias zs="source $HOME/.zshrc"
alias l="la" # overwrite prezto default

# Git Aliases
alias gs="git status" # overwrite prezto default
alias gl="git l" # overwrite prezto default
alias glm="gl master.."
alias gri="git rebase -i --autosquash master"
alias grc="git rebase --continue"
alias gsw="git switch"
alias gsc="git switch -c"
alias gfm='$EDITOR $(git --no-pager diff --name-only --diff-filter=U)'
alias grc="git rebase --continue"
alias gap='git add -p'
alias fixup="git --no-pager log --pretty='format:%h %s' master.. | fzf | cut -d' ' -f1 | xargs git commit --fixup"
alias glc="git diff-tree --no-commit-id --name-only -r HEAD | fzf | xargs nvim --server /tmp/nvimsocket --remote-silent"

# Exports
export LSCOLORS=exfxcxdxbxegedabagacad

# Options
unsetopt CORRECT # no autocorrect thanks

PATH=".git/safe/../../node_modules/.bin:$PATH"
PATH=".git/safe/../../bin:$PATH"

newt() {
  tmux -u new -d -s $1
  tmux rename-window editor
  tmux send-keys v Enter
  tmux new-window -d -n shell
  tmux attach -d -t $1
}

# Load local configurations
test -f $HOME/.zshrc.local && source $HOME/.zshrc.local
