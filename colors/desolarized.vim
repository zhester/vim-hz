"============================================================================
" Desolarized Color Scheme
"============================================================================

" Normal text (not code/syntax)
hi Normal           cterm=none      ctermbg=none    ctermfg=7
hi NonText          cterm=none      ctermbg=none    ctermfg=3

" Utility text
hi Search           cterm=underline ctermbg=none    ctermfg=13
hi DiffText         cterm=none      ctermbg=8       ctermfg=none
hi DiffAdd          cterm=none      ctermbg=2       ctermfg=none
hi DiffChange       cterm=none      ctermbg=3       ctermfg=none
hi DiffDelete       cterm=none      ctermbg=1       ctermfg=none

" Comments
hi Comment          cterm=none      ctermbg=none    ctermfg=2

" Constants
hi Constant         cterm=none      ctermbg=none    ctermfg=3
hi String           cterm=none      ctermbg=none    ctermfg=6
hi link StringDelimiter String

" Identifiers
hi Identifier       cterm=none      ctermbg=none    ctermfg=7
hi Function         cterm=bold      ctermbg=none    ctermfg=12

" Statements
hi Statement        cterm=bold      ctermbg=none    ctermfg=15
hi Operator         cterm=none      ctermbg=none    ctermfg=1

" Preprocessor
hi PreProc          cterm=none      ctermbg=none    ctermfg=12

" Types
hi Type             cterm=none      ctermbg=none    ctermfg=4

" Special
hi Special          cterm=none      ctermbg=none    ctermfg=3
hi SpecialKey       cterm=none      ctermbg=none    ctermfg=5
hi link Delimiter Parens

" Spell checking
hi SpellBad         cterm=underline ctermbg=0       ctermfg=9
hi SpellCap         cterm=underline ctermbg=0       ctermfg=9
hi SpellRare        cterm=underline ctermbg=0       ctermfg=9
hi SpellLocal       cterm=underline ctermbg=0       ctermfg=9

" Other
hi Underlined       cterm=underline ctermbg=none    ctermfg=12
hi Ignore           cterm=none      ctermbg=none    ctermfg=none
hi Error            cterm=none      ctermbg=15      ctermfg=1
hi Todo             cterm=none      ctermbg=none    ctermfg=15

hi ExtraWhitespace  cterm=none      ctermbg=0       ctermfg=9
hi Parens           cterm=none      ctermbg=none    ctermfg=9
hi MatchParen       cterm=none      ctermbg=14      ctermfg=9

hi ColorColumn      cterm=none      ctermbg=11      ctermfg=none
hi CursorLine       cterm=none      ctermbg=0       ctermfg=none
hi LineNr           cterm=none      ctermbg=0       ctermfg=10

" Other UI Elements
hi Pmenu            cterm=none      ctermbg=0       ctermfg=12
hi PmenuSel         cterm=none      ctermbg=11      ctermfg=3
hi PmenuSbar        cterm=none      ctermbg=0       ctermfg=0
hi PmenuThumb       cterm=none      ctermbg=11      ctermfg=3
hi WildMenu         cterm=bold      ctermbg=11      ctermfg=3

" StatusLine
hi StatusLine       cterm=none      ctermbg=11      ctermfg=12
hi StatusLineNC     cterm=none      ctermbg=11      ctermfg=0
hi SLFileName       cterm=bold      ctermbg=11      ctermfg=3
hi SLFlags          cterm=none      ctermbg=11      ctermfg=1
hi SLCursor         cterm=none      ctermbg=11      ctermfg=3
hi SLPlace          cterm=none      ctermbg=11      ctermfg=3
hi SLFileInfo       cterm=none      ctermbg=11      ctermfg=4
hi SLToggle         cterm=none      ctermbg=11      ctermfg=9

