let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>XPTnavFallback =XPTemplateStart(0,{'k':'<Tab++'})
inoremap <Nul> 
imap <D-BS> 
imap <M-BS> 
imap <M-Down> }
inoremap <D-Down> <C-End>
imap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>
inoremap <silent> <Plug>XPTrawKey 	
imap <silent> <Plug>XPTfallback <Plug>XPTrawKey
snoremap <silent> 	 `>a=XPTemplateStart(0,{'k':'<Tab++'})
xnoremap <silent> 	 "0s=XPTemplatePreWrap(@0)
nnoremap <silent>  :nohlsearch
nnoremap <silent> ,b :CommandTBuffer
nnoremap <silent> ,t :CommandT
nnoremap ,s :%s/\<\>/
xmap S <Plug>VSurround
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
xnoremap <silent> s :echoerr 'surround.vim: Visual mode s has been removed in favor of S'
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nmap <Nul> 
map <M-Down> }
noremap <D-Down> <C-End>
map <M-Up> {
noremap <D-Up> <C-Home>
noremap <M-Right> <C-Right>
noremap <D-Right> <End>
noremap <M-Left> <C-Left>
noremap <D-Left> <Home>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
snoremap <Plug>selectToInsert d<BS>
vmap <BS> "-d
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <silent> 	 =XPTemplateStart(0,{'k':'<Tab++'})
inoremap <silent> 	 =XPTemplateStart(0,{'k':'<C-r++<Tab++','forcePum':1})
inoremap <silent> 	 =XPTemplateStart(0,{'k':'<C-r++<C-r++<Tab++','popupOnly':1})
imap  <Plug>Isurround
let &cpo=s:cpo_save
unlet s:cpo_save
set autoread
set background=dark
set backspace=indent,eol,start
set cmdheight=2
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Menlo\ Regular:h14
set guioptions=ac
set guitablabel=%M%t
set helplang=en
set hidden
set hlsearch
set incsearch
set langmenu=none
set laststatus=2
set linespace=1
set mouse=a
set omnifunc=rubycomplete#Complete
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set ruler
set rulerformat=%{XPMautoUpdate(\"ruler\")}
set runtimepath=~/.vim,~/.vim/bundle/vim-coffee-script,~/.vim/bundle/vim-colors-solarized,~/.vim/bundle/vim-rails,~/.vim/bundle/vim-surround,~/.vim/bundle/xptemplate,~/Downloads/MacVim-snapshot-63/MacVim.app/Contents/Resources/vim/vimfiles,~/Downloads/MacVim-snapshot-63/MacVim.app/Contents/Resources/vim/runtime,~/Downloads/MacVim-snapshot-63/MacVim.app/Contents/Resources/vim/vimfiles/after,~/.vim/bundle/vim-coffee-script/after,~/.vim/after,~/.vim/bundle/xptemplate/personal
set shiftwidth=2
set showcmd
set smartcase
set softtabstop=2
set statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
set tabstop=2
set termencoding=utf-8
set visualbell
set window=60
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Documents/scriptman
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 spec/command_spec.rb
badd +1 lib/scriptman/command.rb
badd +7 ~/.vim/bundle/xptemplate/personal/ftplugin/ruby/ruby_new.xpt.vim
silent! argdel *
edit spec/command_spec.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 104 + 104) / 209)
exe 'vert 2resize ' . ((&columns * 104 + 104) / 209)
argglobal
nnoremap <buffer> <silent> g} :exe        "ptjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent> } :exe          "ptag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe      "stselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe        "stjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> ] :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe  v:count1."tag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe       "tselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe         "tjump =RubyCursorIdentifier()"
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,NOTE:\ Gem.all_load_paths\ is\ deprecated\ with\ no\ replacement.\ It\ will\ be\ removed\ on\ or\ after\ 2011-10-01.\
Gem.all_load_paths\ called\ from\ -e:1.\
NOTE:\ Gem.all_partials\ is\ deprecated\ with\ no\ replacement.\ It\ will\ be\ removed\ on\ or\ after\ 2011-10-01.\
Gem.all_partials\ called\ from\ /Library/Ruby/Site/1.8/rubygems.rb:258.\
/Library/Ruby/Site/1.8/rubygems.rb:259:in\ `_deprecated_all_load_paths':\ undefined\ method\ `add'\ for\ \"/Library/Ruby/Gems/1.8\":String\ (NoMethodError)\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:427:in\ `each_load_path'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:426:in\ `each'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:426:in\ `each_load_path'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:421:in\ `each'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:421:in\ `each_load_path'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:258:in\ `_deprecated_all_load_paths'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:257:in\ `each'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:257:in\ `_deprecated_all_load_paths'\
\	from\ /Library/Ruby/Site/1.8/rubygems/deprecate.rb
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]%{XPMautoUpdate(\"statusline\")}
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 62 - ((53 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
62
normal! 02l
wincmd w
argglobal
edit lib/scriptman/command.rb
nnoremap <buffer> <silent> g} :exe        "ptjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent> } :exe          "ptag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe      "stselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe        "stjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> ] :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe  v:count1."tag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe       "tselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe         "tjump =RubyCursorIdentifier()"
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,NOTE:\ Gem.all_load_paths\ is\ deprecated\ with\ no\ replacement.\ It\ will\ be\ removed\ on\ or\ after\ 2011-10-01.\
Gem.all_load_paths\ called\ from\ -e:1.\
NOTE:\ Gem.all_partials\ is\ deprecated\ with\ no\ replacement.\ It\ will\ be\ removed\ on\ or\ after\ 2011-10-01.\
Gem.all_partials\ called\ from\ /Library/Ruby/Site/1.8/rubygems.rb:258.\
/Library/Ruby/Site/1.8/rubygems.rb:259:in\ `_deprecated_all_load_paths':\ undefined\ method\ `add'\ for\ \"/Library/Ruby/Gems/1.8\":String\ (NoMethodError)\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:427:in\ `each_load_path'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:426:in\ `each'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:426:in\ `each_load_path'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:421:in\ `each'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:421:in\ `each_load_path'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:258:in\ `_deprecated_all_load_paths'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:257:in\ `each'\
\	from\ /Library/Ruby/Site/1.8/rubygems.rb:257:in\ `_deprecated_all_load_paths'\
\	from\ /Library/Ruby/Site/1.8/rubygems/deprecate.rb
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]%{XPMautoUpdate(\"statusline\")}
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 47 - ((46 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
47
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 104 + 104) / 209)
exe 'vert 2resize ' . ((&columns * 104 + 104) / 209)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
