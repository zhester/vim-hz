"=============================================================================
"
" hz.vim
"
" Various Utility Functions
"
" Note: This plugin was started to implement functionality I later moved to my
" personal key mappings (it was easier than I thought it would be).  Leaving
" this here because I'll probably start using it later.
"
"=============================================================================

"-----------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------

"-----------------------------------------------------------------------------
" Commands
"-----------------------------------------------------------------------------

" custom hexadecimal conversion commands
command! -nargs=? -range D2H call code#d2h( <line1>, <line2>, '<args>' )
command! -nargs=? -range H2D call code#h2d( <line1>, <line2>, '<args>' )

"-----------------------------------------------------------------------------
" Mappings
"-----------------------------------------------------------------------------

"-----------------------------------------------------------------------------
" Automation
"-----------------------------------------------------------------------------

if has( 'autocmd' )

    "-------------------------------------------------------------------------
    " Plugin autocommand group
    "-------------------------------------------------------------------------
    augroup hz
        autocmd!
    augroup END

    "-------------------------------------------------------------------------
    " Plugin autocommand registration
    "
    " Note: This will clear the editor's initial message that includes the
    "       starting file name (or "newfile"), the number of lines, and the
    "       number of characters in that file.
    "
    " Line-continuation doesn't allow for comments, so here's what this does:
    " 1. Display a heading using our PreProc highlight code.
    " 2. Display the tip of the day using the Type highlight code.
    " 3. Shut off highlighting in the message area.
    " 4. Force redraw to avoid the confirmation.
    "-------------------------------------------------------------------------
    autocmd hz VimEnter *
        \ echohl PreProc | echon 'Tip of the day: ' |
        \ echohl Type | echon memory#OfTheDay() |
        \ echohl None |
        \ redraw

endif

"-----------------------------------------------------------------------------
" Test Code
"-----------------------------------------------------------------------------

