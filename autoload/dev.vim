"=============================================================================
"
" dev.vim
"
" Development for New Vim Scripts
"
"=============================================================================


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

