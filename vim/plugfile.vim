call plug#begin('~/.vim/bundle')

" --- General Plugins {{{
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'shougo/neosnippet.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/camelcasemotion'
Plug 'w0rp/ale'

if has('nvim')
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
endif
" --- }}}

" --- CPP Plugins {{{
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
" --- }}}

" --- CSS Plugins {{{
Plug 'cakebaker/scss-syntax.vim'
Plug 'JulesWang/css.vim'
" --- }}}

" --- HTML-related Plugins {{{
Plug 'othree/html5.vim'
" --- }}}

" --- JavaScript Plugins {{{ 
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
" --- }}}

" --- Java Plugins {{{
Plug 'derekwyatt/vim-scala'
" --- }}}

" --- Ruby Plugins {{{
Plug 'tpope/vim-rails', { 'for': 'ruby' }
" --- }}}

" --- Rust Plugins {{{
Plug 'rust-lang/rust.vim'
" --- }}}

call plug#end()

" vim: ft=vim foldmethod=marker foldlevel=0
