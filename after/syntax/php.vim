"############################################################################
"
" Special PHP Syntax Highlighting
"
"############################################################################

" Override $ highlighting.
hi link phpVarSelector Identifier

" Override -> highlighting.
hi link phpMemberSelector Operator

" Override comparison sequences (==, ===, !=, !==).
hi link phpComparison Operator

" Override , and ; highlighting.
syn match phpPunctuation '[,;]' containedin=phpRegion
hi link phpPunctuation Operator

" I don't like "null" being considered a type.
syn keyword phpNull null containedin=phpRegion
hi link phpNull Constant

" Highlight string delimiters.  I have no idea why they used "None."
hi link None String

" Make use of extended C-style syntax highlighting.
"   Note: So far, the syntax's normal "Operator" group works nicely.
"let $cstyle = expand( 'cstyle.vim' )
"if filereadable( $cstyle )
"    source $cstyle
"endif
