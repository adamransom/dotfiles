hi clear
runtime colors/vim.lua

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "bare"

let s:none = "NONE"
let s:fg = "#444444"
let s:bg = "#fcfcfc"

let s:gray = "#d9d9d9"
let s:light_gray = "#efefef"
let s:dark_gray = "#999999"
let s:darker_gray = "#777777"
let s:black = "#000000"

let s:red = "#c62828"
let s:blue = "#4527a0"
let s:green = "#86b200"

function! s:hi(group, ...)
  let l:fg = get(a:, 1, s:none)
  let l:bg = get(a:, 2, s:none)
  let l:gui = get(a:, 3, 'none')
  let l:guisp = get(a:, 4, s:none)

  exe 'hi' a:group
    \ ' guifg=' l:fg 'guibg=' l:bg 'gui=' l:gui
    \ 'term=' l:gui 'cterm=' l:gui
    \ 'guisp=' l:guisp
endfunction

if &background == "light"
  " Normal
  call s:hi('Normal', s:fg)
  hi! link Constant Normal
  hi! link Identifier Normal
  hi! link Ignore Normal
  hi! link PreProc Normal
  hi! link Special Normal
  hi! link Statement Normal
  hi! link Type Normal
  hi! link Directory Normal
  hi! link Function Normal
  hi! link Operator Normal

  " Secondary
  call s:hi('Comment', s:dark_gray)
  hi! link LineNr Comment
  hi! link SignColumn Comment
  hi! link NonText Comment

  " Error
  call s:hi('Error', s:red, s:none, 'bold')
  call s:hi('ErrorMsg', s:red, s:none, 'bold')
  call s:hi('DiagnosticError', s:red, s:none)
  call s:hi('DiagnosticUnderlineError', s:red, s:none, 'bold,undercurl', s:red)
  call s:hi('DiagnosticUnderlineHint', s:dark_gray, s:none, 'bold,undercurl', s:dark_gray)
  call s:hi('DiagnosticSignError', s:red, s:none, 'bold')
  call s:hi('DiagnosticSignHint', s:dark_gray, s:none, 'bold')

  hi! link SpellBad Error
  hi! link SpellCap Error
  hi! link WarningMsg ErrorMsg
  hi! link DiagnosticHint Comment

  " UI
  call s:hi('Visual', s:none, s:gray)
  call s:hi('WinSeparator', s:gray, s:gray)
  call s:hi('StatusLine', s:darker_gray, s:gray)
  call s:hi('StatusLineNC', s:dark_gray, s:gray)
  call s:hi('User1', s:darker_gray, s:gray, 'bold')

  call s:hi('Pmenu', s:fg, s:light_gray)
  call s:hi('PmenuSel', s:fg, s:gray)
  call s:hi('PmenuSbar', s:fg, s:gray)
  call s:hi('PmenuThumb', s:fg, s:dark_gray)

  call s:hi('QuickFixLine', s:none, s:light_gray)
  call s:hi('Folded', s:dark_gray, s:light_gray)

  " Other
  call s:hi('String', s:fg, s:light_gray)
  call s:hi('IncSearch', s:bg, s:black, 'bold')
  call s:hi('Search', s:black, s:none, 'bold')
  call s:hi('Todo', s:red)
  call s:hi('Link', s:blue)
  call s:hi('SpecialKey', s:blue)
  call s:hi('MatchParen', s:blue, s:light_gray, 'bold')

  call s:hi('diffRemoved', s:red)
  call s:hi('diffAdded', s:green)
end

" Git
hi! link gitCommitOverflow Comment

" Vim
hi! link helpHyperTextJump Link
hi! link helpOption Link

hi! rubyMethodName term=bold gui=bold cterm=bold
