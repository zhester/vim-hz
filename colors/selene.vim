"=============================================================================
"
" selene.vim
"
" A dark color scheme for programming.
"
" Selene is the greek goddess of the moon.  This color scheme improves on some
" of the lessons learned from my desolarized scheme which, itself, was built
" from the famous solarized scheme.
"
" The difference for the Vim bindings is that they should assume a reasonable
" fall-back when the terminal emulator (or physical termainl) isn't perfectly
" configured.  Thus, the standard 16 ANSI colors should, at least, be legible.
"
" This file does not define the colors.  This, rather, gets the ANSI colors in
" a good arrangement to be used with _any_ reasonable scheme.
"
" ZIH - only the background color has been tested.  the other values are
"       placeholders to remind me of relative values.
"
"    foreground #D0D0D0 default foreground
"    background #0C0C0C default background
"    cursor             unique cursor
"  0 black      #1C1C1C intended for UI feature backgrounds
"  1 red                parens/brackets/braces
"  2 green              
"  3 yellow             de-emphasized foreground
"  4 blue               
"  5 magenta            keywords
"  6 cyan               string literals
"  7 white      #A0A0A0 normal text foreground
"  8 bblack     #2C2C2C intended for alternate backgrounds
"  9 bred               operators and punctuation
" 10 bgreen             comments
" 11 byellow
" 12 bblue              types
" 13 bmagenta           special characters
" 14 bcyan              non-string literals
" 15 bwhite     #FAFAFA highlighted/special foreground
"
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
let g:colors_name = 'selene'

"-----------------------------------------------------------------------------
" Editor Display
"-----------------------------------------------------------------------------

" Normal Text (everything that isn't "highlighted", must be first in scheme)
hi Normal           cterm=none      ctermbg=none    ctermfg=7

" Cursor and Selection
hi Cursor           cterm=none      ctermbg=none    ctermfg=11
hi CursorColumn     cterm=none      ctermbg=0       ctermfg=none
hi CursorLine       cterm=none      ctermbg=8       ctermfg=none
hi Visual           cterm=none      ctermbg=0       ctermfg=none

" StatusLine
hi SLBase           cterm=none      ctermbg=0       ctermfg=12
" ZIH - link and override from SLBase
"hi SLCursor         cterm=none      ctermbg=0       ctermfg=3
"hi SLFileInfo       cterm=none      ctermbg=0       ctermfg=4
"hi SLFileName       cterm=none      ctermbg=0       ctermfg=3
"hi SLFlags          cterm=none      ctermbg=0       ctermfg=1
"hi SLPlace          cterm=none      ctermbg=0       ctermfg=3
"hi SLToggle         cterm=none      ctermbg=0       ctermfg=9
"hi StatusLine       cterm=none      ctermbg=0       ctermfg=12
"hi StatusLineNC     cterm=none      ctermbg=0       ctermfg=0

" Menu Interfaces
"hi Pmenu            cterm=none      ctermbg=0       ctermfg=12
"hi PmenuSbar        cterm=none      ctermbg=0       ctermfg=0
"hi PmenuSel         cterm=none      ctermbg=0       ctermfg=3
"hi PmenuThumb       cterm=none      ctermbg=0       ctermfg=3
"hi WildMenu         cterm=none      ctermbg=0       ctermfg=3

" Vertical Window Separators
hi VertSplit        cterm=none      ctermbg=0       ctermfg=12

"-----------------------------------------------------------------------------
" In-buffer Highlighting
"-----------------------------------------------------------------------------

" Searching
"hi IncSearch        cterm=none      ctermbg=8       ctermfg=1
"hi Search           cterm=underline ctermbg=none    ctermfg=13

" Spell Checking
"hi SpellBad         cterm=underline ctermbg=0       ctermfg=9
"hi SpellCap         cterm=underline ctermbg=0       ctermfg=9
"hi SpellLocal       cterm=underline ctermbg=0       ctermfg=9
"hi SpellRare        cterm=underline ctermbg=0       ctermfg=9

" Special Characters and Key Names
hi ExtraWhitespace  cterm=none      ctermbg=0       ctermfg=9
hi Special          cterm=none      ctermbg=none    ctermfg=3
hi SpecialKey       cterm=none      ctermbg=none    ctermfg=13

" Other
"hi Ignore           cterm=none      ctermbg=none    ctermfg=none
"hi NonText          cterm=none      ctermbg=none    ctermfg=3
"hi Todo             cterm=none      ctermbg=none    ctermfg=15
hi Underlined       cterm=underline

"-----------------------------------------------------------------------------
" Informational Highlighting
"-----------------------------------------------------------------------------

" Diff Regions
"hi DiffText         cterm=none      ctermbg=8       ctermfg=none
"hi DiffAdd          cterm=none      ctermbg=2       ctermfg=none
"hi DiffChange       cterm=none      ctermbg=3       ctermfg=none
"hi DiffDelete       cterm=none      ctermbg=1       ctermfg=none

" Errors and Debugging
hi Error            cterm=none      ctermbg=15      ctermfg=1

"-----------------------------------------------------------------------------
" Code Syntax Highlighting
"-----------------------------------------------------------------------------

" Parenthesis, Brackets, and Braces
hi MatchParen       cterm=none      ctermbg=8       ctermfg=1
hi Parens           cterm=none      ctermbg=none    ctermfg=1

" Highlight other delimiters the same as parenthesis.
hi link Delimiter Parens

" Comments
hi Comment          cterm=none      ctermbg=none    ctermfg=2

" Constants
hi Constant         cterm=none      ctermbg=none    ctermfg=14
hi String           cterm=none      ctermbg=none    ctermfg=6

" Highlight other constants similarly.
hi link Boolean Constant
hi link Character Constant
hi link Float Constant
hi link Number Constant

" Include the quotation marks when highlighting string constants.
hi link StringDelimiter String

" Named Identifiers
hi Function         cterm=none      ctermbg=none    ctermfg=12
hi Identifier       cterm=none      ctermbg=none    ctermfg=7

" Language Constructs
hi Operator         cterm=none      ctermbg=none    ctermfg=9
hi Statement        cterm=none      ctermbg=none    ctermfg=15

" Preprocessor
hi PreProc          cterm=none      ctermbg=none    ctermfg=10

" Types
hi Type             cterm=none      ctermbg=none    ctermfg=4

