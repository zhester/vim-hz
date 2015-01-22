"=============================================================================
" Desolarized Color Scheme
"
" See: README.md for additional/helpful information.
"=============================================================================

"-----------------------------------------------------------------------------
" Colorscheme Boilerplate
"-----------------------------------------------------------------------------

" This is a dark scheme.
set background=dark

" Drop current highlighting.
highlight clear

" Reset highlighting to the defaults.
if exists( 'syntax_on' )
    syntax reset
endif

" Set the name of the scheme.
let g:colors_name = 'desolarized'

"-----------------------------------------------------------------------------
" Editor Display
"-----------------------------------------------------------------------------

" Normal Text (everything that isn't "highlighted", must be first in scheme)
hi Normal           cterm=none      ctermbg=none    ctermfg=7

" Cursor and Selection
hi Cursor           cterm=none      ctermbg=none    ctermfg=3
" hi CursorIM         cterm=none      ctermbg=none    ctermfg=13
hi CursorColumn     cterm=none      ctermbg=0       ctermfg=none
hi CursorLine       cterm=none      ctermbg=0       ctermfg=none
hi Visual           cterm=none      ctermbg=0       ctermfg=none
" hi VisualNOS        cterm=none      ctermbg=none    ctermfg=none

" Window Margins
hi ColorColumn      cterm=none      ctermbg=11      ctermfg=none
hi CursorLineNr     cterm=none      ctermbg=8       ctermfg=9
hi LineNr           cterm=none      ctermbg=0       ctermfg=10

" StatusLine
hi SLCursor         cterm=none      ctermbg=11      ctermfg=3
hi SLFileInfo       cterm=none      ctermbg=11      ctermfg=4
hi SLFileName       cterm=bold      ctermbg=11      ctermfg=3
hi SLFlags          cterm=none      ctermbg=11      ctermfg=1
hi SLPlace          cterm=none      ctermbg=11      ctermfg=3
hi SLToggle         cterm=none      ctermbg=11      ctermfg=9
hi StatusLine       cterm=none      ctermbg=11      ctermfg=12
hi StatusLineNC     cterm=none      ctermbg=11      ctermfg=0

" Menu Interfaces
hi Pmenu            cterm=none      ctermbg=0       ctermfg=12
hi PmenuSbar        cterm=none      ctermbg=0       ctermfg=0
hi PmenuSel         cterm=none      ctermbg=11      ctermfg=3
hi PmenuThumb       cterm=none      ctermbg=11      ctermfg=3
hi WildMenu         cterm=bold      ctermbg=11      ctermfg=3

" Command Entry/Results
" hi ModeMsg          cterm=none      ctermbg=none    ctermfg=none
" hi MoreMsg          cterm=none      ctermbg=none    ctermfg=none
" hi Question         cterm=none      ctermbg=none    ctermfg=none
" hi Title            cterm=none      ctermbg=none    ctermfg=none

" File Browser
" hi Directory        cterm=none      ctermbg=none    ctermfg=none

" Folding
" hi Folded           cterm=none      ctermbg=none    ctermfg=none
" hi SignColumn       cterm=none      ctermbg=none    ctermfg=none
" hi FoldColumn       cterm=none      ctermbg=none    ctermfg=none

" Tabs/Windows
" hi TabLine          cterm=none      ctermbg=none    ctermfg=none
" hi TabLineFill      cterm=none      ctermbg=none    ctermfg=none
" hi TabLineSel       cterm=none      ctermbg=none    ctermfg=none
" hi VertSplit        cterm=none      ctermbg=none    ctermfg=none

"-----------------------------------------------------------------------------
" In-buffer Highlighting
"-----------------------------------------------------------------------------

" Searching
hi IncSearch        cterm=bold      ctermbg=8       ctermfg=1
hi Search           cterm=underline ctermbg=none    ctermfg=13

" Spell Checking
hi SpellBad         cterm=underline ctermbg=0       ctermfg=9
hi SpellCap         cterm=underline ctermbg=0       ctermfg=9
hi SpellLocal       cterm=underline ctermbg=0       ctermfg=9
hi SpellRare        cterm=underline ctermbg=0       ctermfg=9

" Special Characters and Key Names
hi ExtraWhitespace  cterm=none      ctermbg=0       ctermfg=9
hi Special          cterm=none      ctermbg=none    ctermfg=3
hi SpecialKey       cterm=none      ctermbg=none    ctermfg=5

" Other
" hi ErrorMsg         cterm=none      ctermbg=none    ctermfg=none
hi Ignore           cterm=none      ctermbg=none    ctermfg=none
hi NonText          cterm=none      ctermbg=none    ctermfg=3
hi Todo             cterm=none      ctermbg=none    ctermfg=15
hi Underlined       cterm=underline ctermbg=none    ctermfg=12
" hi WarningMsg       cterm=none      ctermbg=none    ctermfg=none

"-----------------------------------------------------------------------------
" Informational Highlighting
"-----------------------------------------------------------------------------

" Diff Regions
hi DiffText         cterm=none      ctermbg=8       ctermfg=none
hi DiffAdd          cterm=none      ctermbg=2       ctermfg=none
hi DiffChange       cterm=none      ctermbg=3       ctermfg=none
hi DiffDelete       cterm=none      ctermbg=1       ctermfg=none

" Errors and Debugging
" hi Debug            cterm=none      ctermbg=none    ctermfg=none
hi Error            cterm=none      ctermbg=15      ctermfg=1

"-----------------------------------------------------------------------------
" Code Syntax Highlighting
"-----------------------------------------------------------------------------

" Parenthesis, Brackets, and Braces
hi MatchParen       cterm=none      ctermbg=14      ctermfg=9
hi Parens           cterm=none      ctermbg=none    ctermfg=9

" Highlight other delimiters the same as parenthesis.
hi link Delimiter Parens

" Comments
hi Comment          cterm=none      ctermbg=none    ctermfg=2
" hi SpecialComment

" Constants
hi Constant         cterm=none      ctermbg=none    ctermfg=3
hi String           cterm=none      ctermbg=none    ctermfg=6

" Highlight other constants similarly.
hi link Boolean Constant
hi link Character Constant
hi link Float Constant
hi link Number Constant

" Include the quotation marks when highlighting string constants.
hi link StringDelimiter String

" Named Identifiers
hi Function         cterm=bold      ctermbg=none    ctermfg=12
hi Identifier       cterm=none      ctermbg=none    ctermfg=7

" Language Constructs
" hi Conditional      cterm=none      ctermbg=none    ctermfg=none
" hi Exception        cterm=none      ctermbg=none    ctermfg=none
" hi Keyword          cterm=none      ctermbg=none    ctermfg=none
" hi Label            cterm=none      ctermbg=none    ctermfg=none
hi Operator         cterm=none      ctermbg=none    ctermfg=1
" hi Repeat           cterm=none      ctermbg=none    ctermfg=none
hi Statement        cterm=bold      ctermbg=none    ctermfg=15
" hi Tag              cterm=none      ctermbg=none    ctermfg=none

" Preprocessor
" hi Define           cterm=none      ctermbg=none    ctermfg=none
" hi Include          cterm=none      ctermbg=none    ctermfg=none
" hi Macro            cterm=none      ctermbg=none    ctermfg=none
" hi PreCondit        cterm=none      ctermbg=none    ctermfg=none
hi PreProc          cterm=none      ctermbg=none    ctermfg=12

" Types
" hi StorageClass     cterm=none      ctermbg=none    ctermfg=none
" hi Structure        cterm=none      ctermbg=none    ctermfg=none
hi Type             cterm=none      ctermbg=none    ctermfg=4
" hi Typedef          cterm=none      ctermbg=none    ctermfg=none

