set nocompatible " choose no compatibility with legacy vi

if filereadable(expand("~/.vim/Plugfile"))
  source ~/.vim/Plugfile
endif

runtime macros/matchit.vim

" Load indentation and syntax highlighting
filetype plugin indent on
syntax enable

let mapleader=","               " Mappings are in .vim/plugin/mappings.vim

" --- General --- {{{
if has('cmdline_info')
  set showcmd                   " display incomplete commands
endif
set autoread                    " automatically reload a file when its changed outside vim
if has('multi_byte')
  set encoding=utf-8
  set ambiwidth=double
endif
if v:version > 704 || v:version == 704 && has('patch793')
  set belloff=all               " no bells please
endif
set hidden                      " allowed unsaved buffers to go into background
" --- }}}

" --- Display --- {{{
set background=light
colorscheme therapy
set lazyredraw
set nocursorline
if has('syntax')
  set number                 " show line numbers
  set spellcapcheck=         " don't check for capital letters at start of sentence
  set spelllang=en_gb        " use British English when spell checking
endif
set scrolloff=3              " start scrolling 3 lines before edge of viewport
set sidescrolloff=3          " same as above, but for horizontal scrolling
let loaded_matchparen=1      " turn off matchparen for speed
let g:netrw_altfile=1        " stop netrw from becoming the altfile (interferes with <C-^>)
" --- }}}

" --- Splits --- {{{
if has('windows')
  set splitbelow              " open horizontal splits below current window
endif
if has('vertsplit')
  set splitright              " open vertical splits to the right of the current window
endif
" --- }}}

" --- GUI --- {{{
set guioptions=ac               " hide menu
set guifont=DejaVu\ Sans\ Mono\ 11
" --- }}}

" --- Command & Status --- {{{
set ch=2                        " Make command line two lines high
set stl=%r\                     " Lock symbol if read only
set stl+=%{expand('%:.')}       " Full filepath
set stl+=%(\ %m%)               " Unsaved changes or not
set stl+=\ [%{strlen(&ft)?&ft:'none'},\ %{strlen(&fenc)?&fenc:&enc}] " Filetype and encoding
set stl+=%=                     " Send the rest to the right
set stl+=%l/%L\:%c              " Line and column numbers
set stl+=\ [%b][0x%B]           " ASCII and HEX character code
set laststatus=2                " always show status line
" --- }}}

" --- Whitespace --- {{{
set nowrap                                    " don't wrap lines
set tabstop=2 shiftwidth=2 softtabstop=2      " a tab is two spaces
set expandtab                                 " use spaces, not tabs
set backspace=indent,eol,start                " backspace through everything in insert mode
set smarttab
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j                        " remove comment leader when joining comment lines
endif
set formatoptions+=j                          " smart auto-indenting with numbered lists
set nojoinspaces                              " don't add two spaces when joining on '.', '!' and '?'
if has('virtualedit')
  set virtualedit=block                       " allow cursor to move where there is no text in visual block mode
endif
" --- }}}

" --- Invisible Characters --- {{{
set listchars=nbsp:¬,tab:»\ ,trail:⋅
set showbreak=↪
" --- }}}

" --- Folds --- {{{
if has('folding')
  set foldlevelstart=99               " start unfolded
  set foldmethod=indent               " not as cool as syntax, but faster
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

" --- Autocompletion --- {{{
set complete=.,w,b,u,t,i
if has('insert_expand')
  set completeopt=menu,preview
endif
" --- }}}

" --- Wildignore --- {{{
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

set backupdir=~/.vimtmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vimtmp,~/.tmp,~/tmp,/var/tmp,/tmp

" --- CommandT --- {{{
let g:CommandTMaxHeight=5
if &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<Esc>OB']
  let g:CommandTSelectPrevMap = ['<Esc>OA']
endif
nmap <silent> <Leader>t :CommandT<CR>
nmap <silent> <Leader>gt :CommandTBuffer<CR>
let g:CommandTWildIgnore=&wildignore . ",node_modules/**"
" --- }}}

" --- UltiSnips --- {{{
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
" --- }}}

" --- Global Functions --- {{{
function! Year()
  return strftime("%Y")
endfunction

function! MyName()
  return "Adam Ransom"
endfunction
" --- }}}

" --- Local Overrides --- {{{
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

if filereadable(expand(".pvimrc"))
  source .pvimrc
endif
" --- }}}

" vim: foldmethod=marker foldlevel=0
