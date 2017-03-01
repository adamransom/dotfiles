if has('autocmd')
  augroup AdamAutocmds
    autocmd!
    autocmd VimResized * execute "normal! \<c-w>="
  augroup END
endif
