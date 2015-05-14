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
" Test Code
"-----------------------------------------------------------------------------

