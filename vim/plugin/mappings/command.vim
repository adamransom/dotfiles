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
