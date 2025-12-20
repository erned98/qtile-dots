
hi! clear
syntax reset
let g:colors_name = "flat-remix-eos"
set background=dark
set t_Co=256

hi! Constant		    ctermfg = 15
hi! link Boolean	    Constant
hi! link Character	    Constant
hi! link Number		    Constant
hi! link Float		    Constant
hi! link String		    Constant
hi! link Boolean	    Constant

hi! Statement		    ctermfg = 6
hi! link Conditional	Statement
hi! link Repeat		    Statement
hi! link Label		    Statement
hi! link Keyword	    Statement
hi! link Exception	    Statement
hi! link PreProc	    Statement
hi! link Include	    Statement
hi! link Define		    Statement
hi! link Macro		    Statement
hi! link PreProc	    Statement

hi! Comment		        ctermfg = 5	    cterm = italic

hi! Type		        ctermfg = 15    cterm = bold
hi! link StorageClass	Type
hi! link Structure	    Type
hi! link Typedef	    Type
hi! link Identifier	    Type
hi! link Function	    Type

hi! Operator		    ctermfg = 2	    cterm = bold

hi! Special		        ctermfg = 3	    cterm = bold,italic
hi! link SpecialChar	Special
hi! link Tag		    Special
hi! link Delimiter	    Special
hi! link SpecialComment	Special
hi! link Debug		    Special

hi! Error		        ctermfg = 15	ctermbg = 9
hi! link ErrorMsg	    Error
hi! link MatchParen	    Error

hi! LineNr              ctermfg = 13
hi! Cursor		        ctermfg = 0	    ctermbg = 0
hi! CursorLine		    ctermfg = none	ctermbg = 0   cterm = bold
hi! CursorLineNr	    ctermfg = 3 	ctermbg = 0   cterm = bold
hi! ColorColumn		    ctermfg = 13 	ctermbg = 0
hi! CursorColumn	    ctermfg = none	ctermbg = 0

hi! SpecialKey		    ctermfg = 10	ctermbg = none

hi! SpellBad		    ctermfg = 9	    ctermbg = none	cterm = underline
hi! SpellCap		    ctermfg = 14	ctermbg = none	cterm = underline
hi! SpellLocal		    ctermfg = 10	ctermbg = none	cterm = underline
hi! SpellRare		    ctermfg = 9	    ctermbg = none	cterm = underline

hi! Search		        ctermfg = 15	ctermbg = 13	cterm = italic
hi! IncSearch		    ctermfg = 13	ctermbg = 15	cterm = italic

hi! Directory		    ctermfg = 6	    ctermbg = none
hi! link Title		    Directory

hi! Pmenu		        ctermfg = 10	ctermbg = none
hi! link PmenuSbar	    Pmenu
hi! link PmenuThumb	    Pmenu
hi! PmenuSel		    ctermfg = 10	ctermbg = 8

hi! DiffAdd		        ctermfg = 10	ctermbg = none
hi! DiffChange		    ctermfg = 11	ctermbg = none
hi! DiffDel		        ctermfg = 9	    ctermbg = none
hi! DiffText		    ctermfg = 14	ctermbg = none

hi! StatusLine		    ctermfg = 13 	ctermbg = 15
hi! StatusLineNC	    ctermfg = 15	ctermbg = 13

hi! Visual		        ctermfg = 15    ctermbg = 5
hi! VisualNOS		    ctermfg = none	ctermbg = 8

hi! FoldColumn		    ctermfg = 8	    ctermbg = none
hi! Folded		        ctermfg = 14	ctermbg = none

hi! TabLine		        ctermfg = 10	ctermbg = 0
hi! TabLineSelect	    ctermfg = 14	ctermbg = 8
hi! TabLineFill		    ctermfg = 11	ctermbg = 0

hi! MatchParen          ctermfg = 0     ctermbg = 11    cterm = bold
