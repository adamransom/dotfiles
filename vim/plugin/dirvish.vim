if has('autocmd')
  augroup AdamDirvish
    autocmd!
    autocmd FileType dirvish set nobuflisted
  augroup END
endif
