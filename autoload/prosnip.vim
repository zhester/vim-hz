"=============================================================================
"
" Procedural Snippets
"
" Snippets shouldn't be static pieces of text with a few placeholders.
" Snippets should to be generated at insertion time from callback functions.
"
" TODO
" ----
"
"  - Build a dictionary to manage snippet entry points when the key is entered
"    onto the current line.
"  - The snippet wrapper function must be able to detect the current file type
"    and dispatch type-specific function calls.
"  - Come up with a file storage scheme so that the functions for the current
"    file type are the only ones that are loaded.
"  - Come up with a function API (arguments) that permits convenient access to
"    how the snippet will be inserted (with mulitple substitutions).
"  - Some snippets can be triggered with quasi-"arguments" from the current
"    line.  The whole current line is passed into the function, so it can
"    decide to incorporate the additional parts of the input string or not.
"  - Figure out how to trigger a key-less request (e.g. just press <Tab> on a
"    blank line) to display a list of currently-available keys.
"    - could make use of the `complete()` function to just complete a key,
"      then the next keystroke activates the snippet (I think this is how I
"      currently do it)
"  - Refactor the commenting features from `code.vim` into this system.
"  - Make some utilities for conveniently filling out and formatting snippet
"    components (e.g. comment bars, column-aligned declaration lists, etc.)
"    out to `textwidth`.  Some things may need to be sensitive to the current
"    cursor position as well as the `tabstop` value.
"    - NO MORE `c0` `b2` etc. snippets!
"    - NO MORE worrying about the current column when inserting indendent
"      constructs (functions can also ignore current indent).
"  - support repeat operator
"
"=============================================================================


"=============================================================================
" Entry Point for Expression Mappings
"=============================================================================
function! prosnip#StartExpr()
    " *map <expr> K prosnip#StartExpr() uses returned string as inserted text
    return line( '.' ) . &filetype . mode()
endfunction


"=============================================================================
" Entry Point for Register-like Insertion
"=============================================================================
function! prosnip#StartInsert()
    " inoremap <silent> K <C-r>=prosnip#StartInsert()<CR>
    " Note: This appears to be the only way to actually be _in_ insert mode
    " and call a function (e.g. so the auto-complete box will work).
    let l:opts = [ '123', '456', '789' ]
    call complete( col( '.' ), l:opts )
    return ''
endfunction


"=============================================================================
" ProSnip Master Entry Point
"=============================================================================
function! prosnip#Start( ... )

    " Set the current line to begin scanning/inserting.
    let l:line = a:0 > 0 ? a:1 : line( '.' )

    " Get the content from the current line.
    let l:text = getline( l:line )

    " ZIH temp testing

    " mode() returns 'n' 'i' 'v'
    " note: when bound using `inoremap BLAH <C-o> BLAH` this will report as
    " being in 'n' mode (because it's temporarily not inserting)
    let l:mode = mode()

    let l:msg = 'line:' . l:line . ' ft:' . &filetype . ' mode:' . l:mode

    " call setline( line( '.' ), l:mode )

    if l:mode == 'i'
        call setline( line( '.' ), l:msg )
    else
        echom l:msg
    endif

endfunction


