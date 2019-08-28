" Make Y behave as you would expect
noremap Y y$
" Clear hlsearch with Enter
nnoremap <silent> <Enter> :nohlsearch<CR>
" Let Enter still work in quickfix list
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
