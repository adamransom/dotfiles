hi clear
if exists("syntax_on")
  syntax reset
endif

runtime colors/proton.vim

let g:colors_name = "barelyhear"

" -- redefine some colors --
hi Boolean gui=none guifg=#b08020 guibg=bg
"hi Conditional gui=none
hi Conditional guifg=#605080 guibg=NONE gui=none
hi Constant guifg=#b08020 guibg=#f0e8c0 gui=none
hi Comment guibg=NONE
hi Define gui=none
hi Function guibg=#f2f2f2 guifg=#4e3870 gui=none
hi Identifier guifg=#2980b9 guibg=NONE
hi Include guibg=NONE
hi NonText guibg=#eaeaea
hi Normal guifg=#555555 guibg=#fcfcfc
hi Number guifg=#b08020 guibg=NONE
hi PreProc gui=none guibg=#f6f3fa
hi Special gui=none guifg=#c0392b guibg=#f0f0f0
hi SpecialSimple gui=none guifg=#c0392b guibg=NONE
hi Statement guibg=NONE guifg=#4e3870
hi StatusLine gui=none
hi StatusLineNC gui=none
hi String guifg=#607080 guibg=#f0f0f0 gui=none
hi Title gui=none
hi Type guibg=NONE guifg=#406280
hi CssProp gui=none guibg=NONE guifg=#406280
hi VertSplit guifg=#707070
hi Exception guibg=NONE
hi Operator guifg=#605080 guibg=NONE
hi StorageClass gui=bold,underline guibg=NONE guifg=#406280

" -- cpp syntax --
hi cCustomScope guifg=#607080
hi link cCustomClass Define
hi link cppBoolean Boolean
hi link cppSTLnamespace Type

" -- ruby syntax --
hi erubyDelimiter guifg=#c0392b guibg=NONE
hi link rubyBoolean Boolean
hi link rubyStringDelimiter String
hi link rubySymbol String
hi link rubyClass Statement
hi link rubyDefine Statement
hi link rubyInstanceVariable Define
hi link rubyBlockParameter Define
hi link rubyFunction Function
hi link rubyRailsTestMethod Statement

" -- html syntax --
hi HtmlString guifg=#607080 guibg=NONE
hi link htmlArg Define
hi link htmlEndTag Statement
hi link htmlTag Statement
hi link htmlTagName Statement
hi link htmlLink Normal
hi link javaScript Normal

" -- xml syntax --
hi link xmlEndTag Statement
hi link xmlTag Statement
hi link xmlTagName Statement

" -- yaml syntax --
hi link yamlKeyValueDelimiter SpecialSimple

" -- css syntax --
hi link  cssBraces SpecialSimple
hi link cssFontProp CssProp
hi link cssColorProp CssProp
hi link cssTextProp CssProp
hi link cssBoxProp CssProp
hi link cssRenderProp CssProp
hi link cssAuralProp CssProp
hi link cssRenderProp CssProp
hi link cssGeneratedContentProp CssProp
hi link cssPagingProp CssProp
hi link cssTableProp CssProp
hi link cssUIProp CssProp
hi link cssFontDescriptorProp CssProp
hi link cssBackgroundProp CssProp
hi link cssDimensionProp CssProp
hi link cssPositioningProp CssProp

" -- sass syntax --
hi link sassIdChar SpecialSimple
hi link sassClassChar SpecialSimple
hi link sassClass Define
