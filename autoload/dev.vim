"=============================================================================
"
" dev.vim
"
" Development for New Vim Scripts
"
"=============================================================================


"=============================================================================
" Fetches syntax match groups for the given or current character.
"
" @param line Optionally specify the line to interrogate
" @param col  Optionally specify the column to interrogate
" @return     A string describing the syntax group stack
"=============================================================================
function! dev#GetSyntax( ... )

    " Check or default the cursor position.
    let l:line  = a:0 > 0 ? a:1 : line( '.' )
    let l:col   = a:0 > 1 ? a:2 : col( '.' )

    " Create a list of strings describing the syntax stack.
    let l:stack = []
    for l:id in synstack( l:line, l:col )

        " Get the name of the syntax group.
        let l:name = synIDattr( l:id, 'name' )

        " Check for syntax IDs that are linked to effective IDs.
        let l:tid  = synIDtrans( l:id )
        if l:id != l:tid

            " Append the translated group name.
            let l:name .= ':' . synIDattr( l:tid, 'name' )
        endif

        " Add group name to list.
        call add( l:stack, l:name )

    endfor

    " Return a description of the syntax stack.
    return join( l:stack, '/' )

endfunction
command! Syntax :echo dev#GetSyntax()


"=============================================================================
" Inserts something to the buffer.
"
" @param text The text to insert below the current line.
"=============================================================================
function! dev#InsertIntoBuffer( text )
    let l:current_line = line( '.' )
    call append( l:current_line, a:text )
endfunction


"=============================================================================
" Reads something from the buffer.
" Note: Short local variable names were used since I can't figure out how to
"       separate function arguments between lines.  :help line-continuation
"       does not help.  I still get `E10` when the function is called.
"
" @param num_lines Optional number of lines to read from current position
" @return          A string or list of strings read from the buffer
"=============================================================================
function! dev#ReadFromBuffer( ... )
    let l:n_lines = a:0 > 0 ? a:1 : 1
    let l:c_line = line( '.' )
    if l:n_lines <= 1
        let l:text = getline( l:c_line )
    else
        let l:text = getline( l:c_line, ( l:c_line + l:n_lines ) )
    endif
    return l:text
endfunction


" Store the directory of this script.
" Note: This doesn't work inside functions since '<sfile>' gets changed to
"       the file that is calling the function, not the file in which the
"       function is defined.
let s:__DIR__ = fnamemodify( resolve( expand( '<sfile>:p' ) ), ':h' )


"=============================================================================
" Opens the current file type's snippet definition file in a new buffer.
"
" @param snipdir The snippets directory containing the snippets files.
"                If not specified, this plugin's snippet directory is used.
" @param ftype   Optionally, use a different file type name.
"=============================================================================
function! dev#OpenSnippet( ... )

    " check for a specified snippet directory
    let l:snipdir = a:0 > 0 ? a:1 : expand( s:__DIR__ . '/../snippets' )

    " check for a specified snippet file type name
    let l:name = a:0 > 1 ? a:2 : &filetype

    " create a path to the snippet file
    let l:snipfile = l:snipdir . '/' . l:name . '.snippets'

    " open the snippet file in a new buffer
    execute 'edit ' . l:snipfile

endfunction
function! dev#OpenSnippets()
    call dev#OpenSnippet()
endfunction


"=============================================================================
" Loads content from a string into a preview window.
"
" @param string The string to load into the preview window
" @param title  The "title" to display (the file name on the statusline)
" @param ftype  Optional value for `filetype` (for syntax highlighting)
"=============================================================================
function! dev#PreviewString( string, title, ... )

    " Split string into individual lines (makes everything better).
    let l:lines     = split( a:string, "\n" )
    let l:num_lines = len( l:lines )

    " Open a preview window on the bottom of the view.
    silent! execute 'noautocmd bot pedit ' . fnameescape( a:title )

    " Focus on the new preview window, and configure it appropriately.
    silent! noautocmd wincmd P
    silent! setlocal buftype=nofile bufhidden=wipe
    silent! setlocal nobuflisted noswapfile nowrap nonumber

    " See if we should set a filetype for the preview.
    if a:0 > 0
        silent! execute 'setlocal filetype=' . a:1
    endif

    " Resize the preview window around the content.
    silent! execute 'resize ' . l:num_lines

    " Create a buffer-specific map to close the preview window.
    silent! nnoremap <silent> <buffer> q :q<CR>

    " Load the string (make setline handle each line) into the preview window.
    call setline( '$', l:lines )

endfunction


"=============================================================================
" Map of color names to ANSI escape codes used in SetTermColor().
"=============================================================================
let s:ansi_colors = {
    \ 'foreground' : '10',
    \ 'background' : '11',
    \ 'cursor'     : '12',
    \ 'black'      : '4;0',
    \ 'red'        : '4;1',
    \ 'green'      : '4;2',
    \ 'yellow'     : '4;3',
    \ 'blue'       : '4;4',
    \ 'magenta'    : '4;5',
    \ 'cyan'       : '4;6',
    \ 'white'      : '4;7',
    \ 'bblack'     : '4;8',
    \ 'bred'       : '4;9',
    \ 'bgreen'     : '4;10',
    \ 'byellow'    : '4;11',
    \ 'bblue'      : '4;12',
    \ 'bmagenta'   : '4;13',
    \ 'bcyan'      : '4;14',
    \ 'bwhite'     : '4;15'
\ }


"=============================================================================
" Sends an escape sequence to change one of the ANSI terminal colors.
"
" @param name  The name of the color to change as a string:
"              foreground, background, cursor,
"              black, red, green, yellow, blue, magenta, cyan, white,
"              bblack, bred, bgreen, byellow, bblue, bmagenta, bcyan, bwhite
" @param value The color value as a string: #RRGGBB
"=============================================================================
function! dev#SetTermColor( name, value )
    let l:seq = "\x1B]" . s:ansi_colors[ a:name ] . ';\' . a:value . "\x07"
    execute 'silent !/usr/bin/echo -ne "' . l:seq . '"'
endfunction

