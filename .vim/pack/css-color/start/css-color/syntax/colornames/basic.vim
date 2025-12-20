" Language:     Colorful CSS Color Preview
" Author:       Aristotle Pagaltzis <pagaltzis@gmx.de>
" Commit:       $Format:%H$
" Licence:      The MIT License (MIT)

" W3C basic colors

hi BG000000 guibg=#0d0d0d guifg=#FFFFFF ctermbg=0  ctermfg=15	
hi BGc0c0c0 guibg=#e6e6e6 guifg=#000000 ctermbg=14 ctermfg=0	
hi BG808080 guibg=#198388 guifg=#000000 ctermbg=8  ctermfg=0	
hi BGffffff guibg=#FFFFFF guifg=#000000 ctermbg=15 ctermfg=0	
hi BG800000 guibg=#d41919 guifg=#FFFFFF ctermbg=1  ctermfg=15	
hi BGff0000 guibg=#ec0101 guifg=#FFFFFF ctermbg=9  ctermfg=15	
hi BG800080 guibg=#9855b3 guifg=#FFFFFF ctermbg=5  ctermfg=15	
hi BGff00ff guibg=#962ac3 guifg=#FFFFFF ctermbg=13 ctermfg=15	
hi BG008000 guibg=#5ebdab guifg=#000000 ctermbg=2  ctermfg=15	
hi BG00ff00 guibg=#47d4b9 guifg=#000000 ctermbg=10 ctermfg=0	
hi BG808000 guibg=#fea44c guifg=#000000 ctermbg=3  ctermfg=15	
hi BGffff00 guibg=#FF8a18 guifg=#000000 ctermbg=11 ctermfg=0	
hi BG000080 guibg=#367bf0 guifg=#FFFFFF ctermbg=4  ctermfg=15	
hi BG0000ff guibg=#277fff guifg=#FFFFFF ctermbg=12 ctermfg=15	
hi BG008080 guibg=#49aee6 guifg=#000000 ctermbg=6  ctermfg=15	
hi BG00ffff guibg=#05a1f7 guifg=#000000 ctermbg=14 ctermfg=0	

call extend( b:css_color_hi,
	\{'000000':0,'c0c0c0':1,'808080':1,'ffffff':1,'800000':0,'ff0000':0
	\,'800080':0,'ff00ff':0,'008000':0,'00ff00':1,'808000':0,'ffff00':1
	\,'000080':0,'0000ff':0,'008080':0,'00ffff':1} )

syn case ignore

syn keyword BG000000 black   contained containedin=@colorableGroup
syn keyword BGc0c0c0 silver  contained containedin=@colorableGroup
syn keyword BG808080 gray    contained containedin=@colorableGroup
syn match   BGffffff "\c\<white\(-\)\@!\>" contained containedin=@colorableGroup
syn keyword BG800000 maroon  contained containedin=@colorableGroup
syn keyword BGff0000 red     contained containedin=@colorableGroup
syn keyword BG800080 purple  contained containedin=@colorableGroup
syn keyword BGff00ff fuchsia contained containedin=@colorableGroup
syn keyword BG008000 green   contained containedin=@colorableGroup
syn keyword BG00ff00 lime    contained containedin=@colorableGroup
syn keyword BG808000 olive   contained containedin=@colorableGroup
syn keyword BGffff00 yellow  contained containedin=@colorableGroup
syn keyword BG000080 navy    contained containedin=@colorableGroup
syn keyword BG0000ff blue    contained containedin=@colorableGroup
syn keyword BG008080 teal    contained containedin=@colorableGroup
syn keyword BG00ffff aqua    contained containedin=@colorableGroup
syn keyword BG00ffff cyan    contained containedin=@colorableGroup
