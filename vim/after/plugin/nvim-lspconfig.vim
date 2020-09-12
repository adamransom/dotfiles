if !has('nvim')
  finish
endif

lua << END
  require'nvim_lsp'.solargraph.setup{}
END

function! s:ConfigureBuffer()
    nnoremap <buffer> <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <buffer> <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <buffer> <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
endfunction

if has('autocmd')
  augroup AdamLanguageClient
    autocmd!

    autocmd FileType ruby  call s:ConfigureBuffer()
  augroup END
endif

