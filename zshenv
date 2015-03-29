# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
  PATH=''
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

export EDITOR="mvim -v"
export VISUAL="$EDITOR"
export PAGER="less"

export LESS='-F -g -i -M -R -S -w -X -z-4'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
