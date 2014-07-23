"############################################################################
"
" Special C Syntax Highlighting
"
"############################################################################

" Adding common, but atypical type names for type highlighting.
syn keyword grmType boolean
syn keyword grmType sint8 sint16 sint32 sint64
syn keyword grmType uint8 uint16 uint32 uint64
hi link grmType cType

syn keyword grmKeywords TRUE FALSE NULL
hi link grmKeywords Constant

" Adding type naming convention for type highlighting.
syn match cCustomType display '[a-zA-Z_][a-zA-Z0-9_]\+_t\(ype\|8\|16\|32\)'
hi link cCustomType cType

" Make use of extended C-style syntax highlighting.
runtime syntax/cstyle.vim
