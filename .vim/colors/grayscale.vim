
hi! clear
syntax reset
let g:colors_name = "grayscale"
set background=dark
set t_Co=256

hi! Constant		    	ctermfg = 255
hi! link Boolean	    	Constant
hi! link Character	    	Constant
hi! link Number		    	Constant
hi! link Float		    	Constant
hi! link String		    	Constant
hi! link Boolean	    	Constant

hi! Statement		    	ctermfg = 245
hi! link Conditional		Statement
hi! link Repeat		    	Statement
hi! link Label		    	Statement
hi! link Keyword	    	Statement
hi! link Exception	    	Statement
hi! link PreProc	    	Statement
hi! link Include	    	Statement
hi! link Define		    	Statement
hi! link Macro		    	Statement
hi! link PreProc	    	Statement

hi! Comment		            ctermfg = 238   cterm = italic

hi! Type		            ctermfg = 255   cterm = bold
hi! link StorageClass		Type
hi! link Structure	    	Type
hi! link Typedef	    	Type
hi! link Identifier	    	Type
hi! link Function	    	Type

hi! Operator		    	ctermfg = 248	cterm = bold

hi! Special		            ctermfg = 240	cterm = bold,italic
hi! link SpecialChar		Special
hi! link Tag		    	Special
hi! link Delimiter	    	Special
hi! link SpecialComment		Special
hi! link Debug		    	Special

hi! Error		            ctermfg = 255	ctermbg = 196
hi! link ErrorMsg	    	Error
hi! link MatchParen	    	Error

hi! LineNr              	ctermfg = 235
hi! Cursor		            ctermfg = 0     ctermbg = 0
hi! CursorLine		    	ctermfg = none	ctermbg = 234   cterm = bold
hi! CursorLineNr	    	ctermfg = 253 	ctermbg = 234   cterm = bold
hi! ColorColumn		    	ctermfg = 238 	ctermbg = 0
hi! CursorColumn	    	ctermfg = none	ctermbg = 0

hi! SpecialKey		    	ctermfg = 240	ctermbg = none

hi! SpellBad		    	ctermfg = 196  	ctermbg = none	cterm = underline
hi! SpellCap		    	ctermfg = 248	ctermbg = none	cterm = underline
hi! SpellLocal		    	ctermfg = 245	ctermbg = none	cterm = underline
hi! SpellRare		    	ctermfg = 238  	ctermbg = none	cterm = underline

hi! Search		            ctermfg = 255	ctermbg = 250    cterm = italic
hi! IncSearch		    	ctermfg = 4	    ctermbg = 255	 cterm = italic

hi! Directory		    	ctermfg = 6		ctermbg = none
hi! link Title		    	Directory

hi! Pmenu		            ctermfg = 240	ctermbg = none
hi! link PmenuSbar	    	Pmenu
hi! link PmenuThumb	    	Pmenu
hi! PmenuSel		    	ctermfg = 240	ctermbg = 238

hi! DiffAdd		            ctermfg = 240	ctermbg = none
hi! DiffChange		    	ctermfg = 245	ctermbg = none
hi! DiffDel		            ctermfg = 196   ctermbg = none
hi! DiffText		    	ctermfg = 250	ctermbg = none

hi! StatusLine		    	ctermfg = 253 	ctermbg = 0
hi! StatusLineNC	    	ctermfg = 0		ctermbg = 253

hi! Visual		            ctermfg = 255   ctermbg = 245
hi! VisualNOS		    	ctermfg = none	ctermbg = 238

hi! FoldColumn		    	ctermfg = 238   ctermbg = none
hi! Folded		            ctermfg = 245	ctermbg = none

hi! TabLine		            ctermfg = 255	ctermbg = 0
hi! TabLineSelect	    	ctermfg = 250	ctermbg = 238
hi! TabLineFill		    	ctermfg = 245	ctermbg = 0

hi! MatchParen          	ctermfg = 0     ctermbg = 252	cterm = bold
