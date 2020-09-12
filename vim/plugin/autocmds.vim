if has('autocmd')
  augroup AdamAutocmds
    autocmd!
    autocmd VimResized * execute "normal! \<c-w>="

    " Let Enter still work in quickfix list
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

    autocmd FileType gitcommit setlocal spell
  augroup END

endif
