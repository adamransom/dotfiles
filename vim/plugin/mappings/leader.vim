" Easy buffer switch
nnoremap <Leader><Leader> <C-^>
" Easy vimrc editing
nnoremap <silent> <Leader>ve :e $MYVIMRC<CR>
nnoremap <silent> <Leader>vp :e ~/.vim/plugin/plug.vim<CR>
" Quickly edit file at same path as current file
nnoremap <Leader>ce :e <C-R>=expand('%:p:h')<CR>/
" Display the syntax highlighting of the current word
nnoremap <silent> <Leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Sort selection
vnoremap <silent> <Leader>s :sort<CR>
