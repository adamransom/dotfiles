"
" C++ Filetype Plugin
" Derek Wyatt (derek <at> [my first name][mylastname] <dot> org)
" http://derekwyatt.org
"

let g:cpp_class_scope_highlight = 1

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal textwidth=80

" This makes doxygen comments work the same as regular comments
setlocal comments-=://
setlocal comments+=:///,://

" Setup for indending
setlocal nosmartindent
setlocal autoindent
setlocal cinkeys-=0#
setlocal cinoptions+=^
setlocal cinoptions+=g0
setlocal cinoptions+=:0
setlocal cinoptions+=(0

" Highlight strings inside C comments
let c_comment_strings=1

nmap <silent> <Leader>ff :FSHere<cr>

"
" We want our code to stay within a certain set column length but we don't
" want to be so brutal as to force an automatic word wrap by setting 
" 'textwidth'.  What we want is to give a gentle reminder that we've gone
" over our limits.  To do this, we use the following two functions and some
" colour settings.
"
" In addition to the column highlighting we also want to highlight when
" there are leading tabs in the code - the last thing we want is people not
" using the equivalent of 'expandtab' in their editors.  When we load the
" file in Vim we want to know that we've got some obnoxious leading tabs
" that we should clean up.
"

"
" DisableErrorHighlights()
"
" Clear out the highlighting that was done to warn us about the messes.
"
function! DisableErrorHighlights()
    if exists("w:match120")
        call matchdelete(w:match120)
        unlet w:match120
    endif
    if exists("w:matchTab")
        call matchdelete(w:matchTab)
        unlet w:matchTab
    endif
endfunction

"
" EnableErrorHighlights()
"
" Highlight the stuff we are unhappy with.
"
function! EnableErrorHighlights()
    if !exists("w:match120")
        let w:match120=matchadd('BadInLine', '\%121v.*', -1)
    endif
    if !exists("w:matchTab")
        let w:matchTab=matchadd('BadInLine', '^\t\+', -1)
    endif
endfunction

"
" AlterColour()
"
" This function is used in setting the error highlighting to compute an 
" appropriate colour for the highlighting that is computed independently
" from the colour scheme itself.  I find this nicer than hard-coding the
" colour.
"
function! AlterColour(groupname, attr, shift)
    let clr = synIDattr(synIDtrans(hlID(a:groupname)), a:attr)
    if match(clr, '^#') == 0
        let red   = str2nr(strpart(clr, 1, 2), 16)
        let green = str2nr(strpart(clr, 3, 2), 16)
        let blue  = str2nr(strpart(clr, 5, 2), 16)
        let red = red + a:shift
        if red <= 0
            let red = "00"
        elseif red >= 256
            let red = "ff"
        else
            let red = printf("%02x", red)
        end
        let green = green + a:shift
        if green <= 0
            let green = "00"
        elseif green >= 256
            let green = "ff"
        else
            let green = printf("%02x", green)
        end
        let blue = blue + a:shift
        if blue <= 0
            let blue = "00"
        elseif blue >= 256
            let blue = "ff"
        else
            let blue = printf("%02x", blue)
        end
        return "#" . red . green . blue
    elseif strlen(clr) != 0
        echoerr 'Colour is not in hex form (' . clr . ')'
        return clr
    else
        return ''
    endif
endfunction

" The syntax highlight we use for the above error highlighting is 'BadInLine'
" and we set what that colour is right here.  I use the AlterColour() function
" defined above to compute the right colour that's essentially colorshceme
" neutral
"
" It's easier just to use black :)
let darkerbg = ""
if strlen(darkerbg) == 0
    let darkerbg = "black"
end
exe "hi BadInLine gui=none guibg=" . darkerbg

" Enable/Disable the highlighting of tabs and of line length overruns
nmap <silent> ,ee :call EnableErrorHighlights()<CR>
nmap <silent> ,ed :call DisableErrorHighlights()<CR>

" set up retabbing on a source file
nmap <silent> ,rr :1,$retab<CR>

" Fix up indent issues - I can't stand wasting an indent because I'm in a
" namespace.  If you don't like this then just comment this line out.
setlocal indentexpr=GetCppIndentNoNamespace(v:lnum)

"
" Helper functions for the Indent code below
"
function! IsBlockComment(lnum)
    if getline(a:lnum) =~ '^\s*/\*'
        return 1
    else
        return 0
    endif
endfunction

function! IsBlockEndComment(lnum)
    if getline(a:lnum) =~ '^\s*\*/'
        return 1
    else
        return 0
    endif
endfunction

function! IsLineComment(lnum)
    if getline(a:lnum) =~ '^\s*//'
        return 1
    else
        return 0
    endif
endfunction

function! IsBrace(lnum)
    if getline(a:lnum) =~ '^\s*{'
        return 1
    else
        return 0
    endif
endfunction

function! IsCode(lnum)
    if !IsBrace(a:lnum) && getline(a:lnum) =~ '^\s*\S'
        return 1
    else
        return 0
    endif
endfunction

"
" GetCppIndentNoNamespace()
"
" This little function calculates the indent level for C++ and treats the
" namespace differently than usual - we ignore it.  The indent level is the for
" a given line is the same as it would be were the namespace not event there.
"
function! GetCppIndentNoNamespace(lnum)
    let nsLineNum = search('^\s*\<namespace\>\s\+\S\+', 'bnW')
    if nsLineNum == 0
        return cindent(a:lnum)
    else
        let inBlockComment = 0
        let inLineComment = 0
        let inCode = 0
        for n in range(nsLineNum + 1, a:lnum - 1)
            if IsBlockComment(n)
                let inBlockComment = 1
            elseif IsBlockEndComment(n)
                let inBlockComment = 0
            elseif IsLineComment(n) && inBlockComment == 0
                let inLineComment = 1
            elseif IsCode(n) && inBlockComment == 0
                let inCode = 1
                break
            endif
        endfor
        if inCode == 1
            if IsBrace(a:lnum) && GetCppIndentNoNamespace(a:lnum - 1) == 0
                return 0
            else
                return cindent(a:lnum)
            endif
        elseif inBlockComment
            return cindent(a:lnum)
        elseif inLineComment
            if IsCode(a:lnum)
                return cindent(nsLineNum)
            else
                return cindent(a:ln)
            endif
        elseif inBlockComment == 0 && inLineComment == 0 && inCode == 0
            return cindent(nsLineNum)
        endif
    endif
endfunction

"
" ProtoDef Settings
" See http://www.vim.org/scripts/script.php?script_id=2624
"
"let g:protodefprotogetter = expand($VIM) . '/pullproto.pl'
let g:protodefctagsexe = '/usr/local/bin/ctags'

augroup local_ftplugin_cpp
    au!
    " Enable and disable the highlighting of lines greater than
    " our 'allowed' length
    "au BufWinEnter *.h,*.cpp call EnableErrorHighlights()
    "au BufWinLeave *.h,*.cpp call DisableErrorHighlights()
    " Change the directory when entering a buffer
    "au BufWinEnter,BufEnter *.h,*.cpp :lcd %:h
    " Settings for the FSwitch plugin
    " See http://www.vim.org/scripts/script.php?script_id=2590
    au BufEnter *.cpp let b:fswitchlocs = 'reg:/src/include/,reg:|src|include/**|,../include'
    au BufEnter *.h let b:fswitchlocs = 'reg:/include/src/,reg:|include/.*|src|,reg:|include/.*||,../src'
    au BufEnter *.h let b:fswitchdst = 'cpp'

    "au BufEnter *.cpp,*.h let g:easytags_auto_highlight = 1
    au BufEnter *.cpp,*.h let g:easytags_auto_update = 1
    "au BufLeave *.cpp,*.h let g:easytags_auto_highlight = 0
    au BufLeave *.cpp,*.h let g:easytags_auto_update = 0
augroup END

function! InsertNameSpace(beginOrEnd)
    let dir = expand('%:p:h')
    let ext = expand('%:e')
    if ext == 'cpp'
        let dir = FSReturnCompanionFilenameString('%')
        let dir = fnamemodify(dir, ':h')
    endif
    let idx = stridx(dir, 'include/')
    let nsstring = ''
    if idx != -1
        let dir = strpart(dir, idx + strlen('include') + 1)
        let nsnames = split(dir, '/')
        let nsdecl = join(nsnames, ' { namespace ')
        let nsdecl = "\n".'namespace '.nsdecl.' {'
        if a:beginOrEnd == 0
            let nsstring = nsdecl
        else
            for i in nsnames
                let nsstring = nsstring.'} '
            endfor
            let nsstring =  nsstring . '// end of namespace '.join(nsnames, '::') . "\n"
        endif
        let nsstring = nsstring
    endif

    return nsstring
endfunction

function! InsertNameSpaceBegin()
    return InsertNameSpace(0)
endfunction

function! InsertNameSpaceEnd()
    return InsertNameSpace(1)
endfunction

function! GetNSFName(snipend)
    let dirAndFile = expand('%:p')
    let idx = stridx(dirAndFile, 'include')
    if idx != -1
        let fname = strpart(dirAndFile, idx + strlen('include') + 1)
    else
        let fname = expand('%:t')
    endif
    if a:snipend == 1
        let fname = expand(fname.':r')
    endif

    return fname
endfunction

function! GetNSFNameDefine()
    let dir = expand('%:p:h')
    let ext = toupper(expand('%:e'))
    let idx = stridx(dir, 'include')
    if idx != -1
        let subdir = strpart(dir, idx + strlen('include') + 1)
        let define = substitute(subdir, '/', '_', 'g')
        let define = define ."_".expand('%:t:r')."_" . ext
        let define = toupper(define)
        let define = substitute(define, '^_\+', '', '')
        return define
    else
        return toupper(expand('%:t:r'))."_" . ext
    endif
endfunction

function! GetHeaderForCurrentSourceFile()
    let header=FSReturnCompanionFilenameString('%')
    if stridx(header, '/include/') == -1
        let header = substitute(header, '^.*/include/', '', '')
    else
        let header = substitute(header, '^.*/include/', '', '')
    endif

    return header
endfunction
