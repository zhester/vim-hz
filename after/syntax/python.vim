"############################################################################
"
" Special Python Syntax Highlighting
"
"############################################################################

" "self" isn't really Python, but it's nearly universal.
syn keyword pythonBuiltin self

" "None" should be a constant, not a built-in.
syn keyword pythonNone None
hi link pythonNone Constant

" Make use of extended C-style syntax highlighting.
runtime syntax/cstyle.vim
