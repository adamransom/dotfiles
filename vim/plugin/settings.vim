" --- General --- {{{
set autoread                          " automatically reload a file when its changed outside vim

if exists('$SUDO_USER')
  set nobackup                        " don't create root-owned files
  set nowritebackup                   " don't create root-owned files
  set noswapfile                      " don't create root-owned files
else
  set backupdir=~/.vimtmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vimtmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif

set hidden                           " allowed unsaved buffers to go into background

if exists('&swapsync')
  set swapsync=                      " let OS sync swapfiles lazily
endif

if has('syntax')
  set spellcapcheck=         " don't check for capital letters at start of sentence
  set spelllang=en_gb        " use British English when spell checking
endif

if has('wildignore')
  set wildignore+=tmp/**
  set wildignore+=**/.git/*
  set wildignore+=*.xcodeproj/*
  set wildignore+=*.xcworkspace/*
endif

if has('wildmenu')
  set wildmenu                        " show options as list when switching buffers etc
endif

set wildmode=longest:full,full        " shell-like autocomplete to unambiguous portion
" --- }}}

" --- Display --- {{{
if !has('nvim') && has('multi_byte')
  set encoding=utf-8
  set ambiwidth=double
endif

set lazyredraw
set listchars=nbsp:¬
set listchars+=tab:»\
set listchars+=trail:⋅

if has('linebreak')
  set showbreak=↪
end
" --- }}}

" --- Whitespace --- {{{
set backspace=indent,eol,start                " backspace through everything in insert mode
set expandtab                                 " use spaces, not tabs

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j                        " remove comment leader when joining comment lines
endif

set formatoptions+=n                          " smart auto-indenting with numbered lists
set nojoinspaces                              " don't add two spaces when joining on '.', '!' and '?'
set nowrap                                    " don't wrap lines
set smarttab
set tabstop=2 shiftwidth=2 softtabstop=2      " a tab is two spaces

if has('virtualedit')
  set virtualedit=block                       " allow cursor to move where there is no text in visual block mode
endif
" --- }}}

" --- UI --- {{{
if v:version > 704 || v:version == 704 && has('patch793')
  set belloff=all               " no bells please
endif

set complete=.,w,b,u

if has('insert_expand')
  set completeopt=menu,preview
endif

if has('folding')
  set fillchars+=fold:\ 
  set foldlevelstart=99         " start unfolded
  set foldmethod=indent         " not as cool as syntax, but faster
endif

set laststatus=2                " always show status line

if has('syntax')
  set nocursorline
  set number                    " show line numbers
endif

set scrolloff=3                 " start scrolling 3 lines before edge of viewport
set sidescrolloff=3             " same as above, but for horizontal scrolling

if has('cmdline_info')
  set showcmd                   " display incomplete commands
endif

if has('windows')
  set splitbelow                " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                " open vertical splits to the right of the current window
endif
" --- }}}

" --- Searching --- {{{
if has('extra_search')
  set hlsearch                  " highlight matches
  set incsearch                 " incremental searching
endif

set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
" --- }}}

" vim: foldmethod=marker foldlevel=0
