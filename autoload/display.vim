"=============================================================================
"
" display.vim
"
" Personal Vim Interface Display Features
"
"=============================================================================

"=============================================================================
" Toggles traditional (non-relative) line numbering.
"=============================================================================
function! display#ToggleNumber()
    " if both are enabled, disable relative numbering
    if &number && &relativenumber
        set norelativenumber
    " if enabled, disable
    elseif &number
        set nonumber
    " if relative numbering is displayed, switch to traditional
    elseif &relativenumber
        set norelativenumber
    " if both are disabled, enable both
    else
        set norelativenumber
        set number
    endif
    set number?
endfunction

"=============================================================================
" Toggles relative line numbering.
"=============================================================================
function! display#ToggleRelativeNumber()
    " if both are enabled, disable both
    if &relativenumber && &number
        set nonumber
        set norelativenumber
    " if enabled, disable
    elseif &relativenumber
        set norelativenumber
    " if traditional numbering is displayed, switch to relative
    elseif &number
        set relativenumber
    " if both are disabled, enable both
    else
        set number
        set relativenumber
    endif
    set relativenumber?
endfunction

