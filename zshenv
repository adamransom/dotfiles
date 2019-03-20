export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER="less"

export LESS='-F -g -i -M -R -S -w -X -z-4'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
