"############################################################################
"
" Special JavaScript Syntax Highlighting
"
"############################################################################

" Default syntax won't match fractional literals entirely.
syn match javaScriptFractionLiteral display '\d\+\.\d\+'
hi link javaScriptFractionLiteral Constant

" Highlight value constants.
hi link javaScriptValue Constant

" "null" should be a constant, not a statement
hi link javaScriptNull Constant

" Highlight member access operator.
"   ZIH - this doesn't work since the highlighter doesn't consider
"         non-captured sub-groups to be outside of its responsibility
"   ZIH - will probably need to do some kind of nested matching
" syn match javaScriptMemberAccess display '\%(\w\+\s*\)\.\%(\s*\w\+\)'
" hi link javaScriptMemberAccess Operator

" Make use of extended C-style syntax highlighting.
runtime syntax/cstyle.vim
