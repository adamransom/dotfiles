filetype off

if filereadable(expand("~/.vim/plugfile.vim"))
  source ~/.vim/plugfile.vim
endif

" Load indentation and syntax highlighting
filetype plugin indent on
syntax on

" Load matchit.vim, but only if we don't have a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Setup FZF
set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages'

let mapleader=","

" Local overrides
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

if filereadable(expand(".pvimrc"))
  source .pvimrc
endif

" Vim settings: .vim/plugin/settings.vim
" Vim mappings: .vim/plugin/mappings/
