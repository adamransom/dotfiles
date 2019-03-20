" --- General Mappings --- {{{

" Make Y behave as you would expect
noremap Y y$

" --- }}}

" --- Normal Mappings --- {{{

" Easy vimrc editing
nnoremap <silent> <Leader>ve :e $MYVIMRC<CR>
nnoremap <silent> <Leader>vs :so $MYVIMRC<CR>
" Display the syntax highlighting of the current word
nnoremap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Easy buffer switch
nnoremap <Leader><Leader> <C-^>
" Trying FZF...
nnoremap <silent> <Leader>t :Files<CR>
nnoremap <silent> <Leader>gt :Buffers<CR>
" Clear hlsearch with Enter
nnoremap <silent> <Enter> :nohlsearch<CR>
" Let Enter still work in quickfix list
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" Substitute currently selected word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" Toggle invisible characters
nnoremap <Leader>l :set list!<CR>:set list?<CR>
" Quickly duplicate line
nnoremap <C-j> yyp
" Quicly edit file at same path as current file
nnoremap <Leader>ce :e <C-R>=expand('%:p:h%')<CR>/
" Paste contents of clipboard around current line
nnoremap <Leader>p o<ESC>V"+p
nnoremap <Leader>P O<ESC>V"+p
" Open current file directory with netrw for easy switching
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : fnameescape(expand('%:p:h'))<CR><CR>
" Quickfix navigation
nnoremap <silent> ]] :cn<CR>
nnoremap <silent> [[ :cp<CR>
" Better terminal handling
tnoremap <C-j> <C-\><C-n>
" --- }}}

" --- Insert Mappings --- {{{

" Smash escape
inoremap jj <Esc>`^
inoremap jk <Esc>`^
" Insert a hash rocket with <C-l>
inoremap <C-l> <space>=><space>

" --- }}}

" --- Visual Mappings --- {{{

" Sort selection
vnoremap <silent> <Leader>s :sort<CR>

" --- }}}

" --- Command Line Mappings --- {{{

" Beginning of line
cnoremap <C-a>          <Home>
" End of line
cnoremap <C-e>          <End>
" Previous character
cnoremap <C-b>          <Left>
" Next character
cnoremap <C-f>          <Right>
" Next in history
cnoremap <C-n>          <Down>
" Previous in history
cnoremap <C-p>          <Up>
" Save with sudo
cnoremap w!! w !sudo tee > /dev/null "%"

" --- }}}

" --- Language Server --- {{{
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" --- }}}

" --- Testing --- {{{
nnoremap <Leader>rr :w \| TestFile<CR>
nnoremap <Leader>re :w \| TestNearest<CR>
nnoremap <Leader>ra :w \| TestSuite<CR>
nnoremap <Leader>rw :w \| TestLast<CR>
" --- }}}

" --- neosnippet --- {{{
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" --- }}}

" vim: foldmethod=marker foldlevel=0
