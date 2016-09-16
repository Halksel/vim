syn keyword cppType ll
syn keyword cppType pll
highlight Type ctermfg= Green guifg=Green
highlight String ctermfg= Red guifg=Red
highlight Macro ctermfg= Gray guifg=Gray
highlight Function ctermfg= magenta guifg=magenta


" Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
hi def link cCustomClass Function
