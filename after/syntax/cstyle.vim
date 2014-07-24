"############################################################################
"
" Extended C-style Syntax Matching
" Note: This is not intended for sole use with C, but also C-style languages
"       such as C++, Java, PHP, ECMA, etc.
"
"############################################################################

" Define a complicated expression for matching operators intelligently.
" Source (minus my own adjustments):
"   http://stackoverflow.com/questions/1199267/
"     braces-and-operators-coloring-in-vim-for-c
let cOperatorList  = '[-&|+<>=*/!~]'    " A list of symbols that we don't want
                                        "   to immediately precede the operator
let cOperatorList .= '\@<!'             " Negative look-behind (check that the
                                        "   preceding symbols aren't there)
let cOperatorList .= '\%('              " Beginning of a list of possible
                                        "   operators
let cOperatorList .=     '\('           " First option, the following symbols...
let cOperatorList .=        '[-&*|+<>=]'
let cOperatorList .=     '\)'
let cOperatorList .=     '\1\?'         " Followed by (optionally) the exact
                                        "  same symbol, so -, --, =, ==, &, &&
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '->'           " Pointer dereference operator
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '[-+*/%&^|!]=' " One of the listed symbols followed by
                                        "   an =, e.g. +=, -=, &= etc
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '[*/?:,!~%]'   " Some simple single character operators
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '\('           " One of the shift characters:
let cOperatorList .=         '[<>]'
let cOperatorList .=     '\)'
let cOperatorList .=     '\2'           " Followed by another identical
                                        "   character, so << or >>...
let cOperatorList .=     '='            " Followed by =, so <<= or >>=.
let cOperatorList .= '\)'               " End of the long list of options
let cOperatorList .= '[-&|+<>=*/!~]'    " The list of symbols that we don't want
                                        "   to follow
let cOperatorList .= '\@!'              " Negative look-ahead (this and the \@<!
                                        "   prevent === etc from matching)

" Compile/execute the operator matching.
exe "syn match cOperator display '" . cOperatorList . "'"

" Also, match triple-equals (for JavaScript and PHP).
syn match cOperator display '==='

" Also, match semi-colons.
syn match cOperator display ';'

" Link the C-style operators to the normal operator syntax highlighting.
hi link cOperator Operator

" Establish a highlight group for braces.
syn match cBraces display '[{}()\[\]]'
hi link cBraces Parens

" Highlight custom class and function names.
syn match cCustomParen '?=(' contains=cParen,cCppParen
syn match cCustomFunc '[a-zA-Z_][a-zA-Z0-9_]\+\s*(\@=' contains=cCustomParen
syn match cCustomScope '::'
syn match cCustomClass '\w\+\s*::' contains=cCustomScope
hi def link cCustomFunc Function
hi def link cCustomClass Function

