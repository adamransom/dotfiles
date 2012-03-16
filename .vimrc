call pathogen#infect()
runtime macros/matchit.vim

" -- General --
set nocompatible                " choose no compatibility with legacy vi
set showcmd                     " display incomplete commands
set autoread                    " automatically reload a file when its changed outside vim
set encoding=utf-8
set vb                          " set visual bell
let g:loaded_netrwPlugin = 1    " stop loading directory browser
set hidden                      " allowed unsaved buffers to go into background

" -- Display --
set background=light
colorscheme solarized
set guifont=Menlo\ Regular:h14
set lsp=1                       " set a bit extra linespace for readability
syntax enable                   " of course we want syntax highlighting
filetype plugin indent on       " load file type plugins + indentation

" -- MacVim --
set guioptions=ac               " hide menu

" -- Command & Status
set ch=2                        " Make command line two lines high
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
set laststatus=2                " always show status line
set cursorline

" -- Whitespace --
set nowrap                                    " don't wrap lines
set tabstop=2 shiftwidth=2 softtabstop=2      " a tab is two spaces
set expandtab                                 " use spaces, not tabs
set backspace=indent,eol,start                " backspace through everything in insert mode

" -- Invisible Characters --
set listchars=tab:»\ ,trail:⋅
set showbreak=↪

" -- Searching --
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set noignorecase                " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" -- Mappings --
let mapleader=","

" -- .vimrc --
augroup AutoReloadVimRC
  au!
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END
noremap <Leader>v :e $MYVIMRC<CR>

" -- ctags --
set tags=tags

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
inoremap kj <Esc>`^
inoremap jk <Esc>`^
" Easy to a edit file in same directory
cabbr <expr> %% expand('%:p:h%')

" -- CommandT --
let g:CommandTMaxHeight=5
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTSelectNextMap = ['<Esc>OB']
  let g:CommandTSelectPrevMap = ['<Esc>OA']
endif

" -- XPTemplate --
let g:xptemplate_key = '<Tab>'

" -- Turbux --
let g:no_turbux_mappings=1
nmap <Leader>r <Plug>SendTestToTmux
nmap <Leader>R <Plug>SendFocusedTestToTmux

" == Language Specific ==

" -- Java --
let java_highlight_functions="style"

" -- Ruby --
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
highlight Pmenu ctermbg=238 gui=bold

set backupdir=~/.vimtmp,~/tmp,/var/tmp
