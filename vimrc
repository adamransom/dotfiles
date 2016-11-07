set nocompatible " choose no compatibility with legacy vi
filetype off     " required for Vundle

if filereadable(expand("~/.vim/Vundlefile"))
  source ~/.vim/Vundlefile
endif

runtime macros/matchit.vim

" -- General --
set showcmd                     " display incomplete commands
set autoread                    " automatically reload a file when its changed outside vim
set encoding=utf-8
set vb                          " set visual bell
let g:loaded_netrwPlugin = 1    " stop loading directory browser
set hidden                      " allowed unsaved buffers to go into background

" -- Display --
set background=light
colorscheme barelyhear
set guifont=Menlo:h12
syntax enable                         " of course we want syntax highlighting
filetype plugin indent on             " load file type plugins + indentation
set lazyredraw
set nocursorline

nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" -- MacVim --
set guioptions=ac               " hide menu

" -- Command & Status
set ch=2                        " Make command line two lines high
set stl=%{&readonly?'✘\ ':''}   " Lock symbol if read only
set stl+=%{expand('%:.')}       " Full filepath
set stl+=%(\ %m%)               " Unsaved changes or not
set stl+=\ [%{strlen(&ft)?&ft:'none'},\ %{strlen(&fenc)?&fenc:&enc}] " Filetype and encoding
set stl+=%=                     " Send the rest to the right
set stl+=Line:\ %l/%L[%p%%]\ Col:\ %c " Line and column numbers
set stl+=\ Buf:\ #%n            " Buffer number
set stl+=\ [%b][0x%B]           " ASCII and HEX character code
set laststatus=2                " always show status line

" -- Whitespace --
set nowrap                                    " don't wrap lines
set tabstop=2 shiftwidth=2 softtabstop=2      " a tab is two spaces
set expandtab                                 " use spaces, not tabs
set backspace=indent,eol,start                " backspace through everything in insert mode

" -- Invisible Characters --
set listchars=nbsp:¬,tab:»\ ,trail:⋅
set showbreak=↪

" -- Searching --
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set complete=.,w,b,t
set number
set ambiwidth=double

set wildignore+=tmp/**
set wildignore+=**/.git/*
set wildignore+=*.xcodeproj/*
set wildignore+=*.xcworkspace/*

" -- Customize Colors --
highlight MatchParen gui=bold guibg=NONE guifg=red cterm=bold ctermbg=NONE ctermfg=red
let g:cpp_class_scope_highlight = 1

" -- Mappings --
let mapleader=","

" -- .vimrc --
augroup AutoReloadVimRC
  au!
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END
noremap <Leader>v :e $MYVIMRC<CR>

" Clear hlsearch with Enter
nnoremap <silent> <Enter> :nohlsearch<CR>
" Substitute currently selected word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" Easy buffer switch
noremap <Leader><Leader> <C-^>
" Make Y behave as you would expect
map Y y$
" Smash escape
inoremap jj <Esc>`^
inoremap jk <Esc>`^
" Easy to a edit file in same directory
cabbr <expr> %% expand('%:p:h%')
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Toggle invisible characters
nnoremap <silent> <Leader>l :set list!<CR>
" Quickly duplicate line
nnoremap <C-j> yyp

" -- CommandT --
let g:CommandTMaxHeight=5
if &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<Esc>OB']
  let g:CommandTSelectPrevMap = ['<Esc>OA']
endif
nmap <silent> <Leader>t :CommandT<CR>
nmap <silent> <Leader>gt :CommandTBuffer<CR>

" -- UltiSnips --
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" -- Turbux --
let g:no_turbux_mappings=1
nmap <Leader>r <Plug>SendTestToTmux
nmap <Leader>R <Plug>SendFocusedTestToTmux

" -- Java --
let java_highlight_functions="style"

let loaded_matchparen = 1 " turn off matchparen for speed

set backupdir=~/.vimtmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vimtmp,~/.tmp,~/tmp,/var/tmp,/tmp

nnoremap <silent> <Leader>cf :!~/cppformat %<CR>

" -- Global Functions

function! Year()
  return strftime("%Y")
endfunction

function! MyName()
  return "Adam Ransom"
endfunction

" -- Local Overrides
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
