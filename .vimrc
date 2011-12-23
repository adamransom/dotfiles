call pathogen#infect()

"" General
set background=dark
colorscheme solarized
set guifont=Menlo\ Regular:h14
set lsp=1
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set autoread
" Make command line two lines high
set ch=2
filetype plugin indent on       " load file type plugins + indentation
set guioptions=ac               " hide menu
set vb                          " set visual bell -- I hate that damned beeping
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
set laststatus=2                " always show status line
let mapleader=","
" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2 softtabstop=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

autocmd FileType java setlocal tabstop=4 shiftwidth=4 noexpandtab 

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

"" Java
let java_highlight_functions="style"

"" CommandT
let g:CommandTMaxHeight=5
