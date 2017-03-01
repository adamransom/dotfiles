" Set up Cargo as the compiler
compiler cargo

" Some nice mappings for building, running and testing
nnoremap <buffer> <Leader>r :make run<CR>
nnoremap <buffer> <Leader>d :make build<CR>:copen<CR>
nnoremap <buffer> <Leader>e :make test<CR>:copen<CR>

" Easy jumping to definitions
nmap <buffer> gd <Plug>(rust-def)
nmap <buffer> gx <Plug>(rust-def-vertical)
