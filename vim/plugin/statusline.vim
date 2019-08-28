if has('statusline')
  set stl=%r\                     " Lock symbol if read only
  set stl+=%{adam#statusline#file_prefix()}
  set stl+=%1*                    " Switch to User1 highlight
  set stl+=%t\                    " File name
  set stl+=%*                     " Reset highlighting
  set stl+=%(%m%)                 " Unsaved changes or not
  set stl+=%([%R%{adam#statusline#ft()}%{adam#statusline#fenc()}]%)
  set stl+=%=                     " Send the rest to the right
  set stl+=%l/%L\:%c              " Line and column numbers
  set stl+=\ [%b][0x%B]           " ASCII and HEX character code
endif
