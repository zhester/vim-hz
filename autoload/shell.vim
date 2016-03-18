"=============================================================================
"
" shell.vim
"
" Shell Interaction Functions
"
"=============================================================================

"-----------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------

"=============================================================================
" Executes the file opened in the current buffer using Python.  All output
" from the script is sent to a scratch buffer.
" ZIH - refactor this into generic 'shell' function, and move to vim-hz
" ZIH - when offering completions, -complete=file is an option
" ZIH - could also use a generic 'write-to-scratch' function
"=============================================================================
function! shell#PyRun( ... )
    let l:command = 'python ' . shellescape( expand( '%:p' ) )
    if a:0 >= 1
        for l:arg in split( a:1 )
            if l:arg[ 0 ] =~ '\v[%#<]'
                let l:arg = expand( l:arg )
            endif
            let l:command .= ' ' . shellescape( l:arg, 1 )
        endfor
    endif
    let l:buffer_input  = bufwinnr( '%' )
    let l:buffer_output = bufwinnr( '\[Python\]' )
    if l:buffer_output >= 0
        execute l:buffer_output . 'wincmd w'
        silent! normal ggdG
    else
        silent! botright new [Python]
        setlocal buftype=nofile
        setlocal bufhidden=wipe
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
    endif
    call setline( 1, l:command )
    execute 'silent! read !' . l:command
    setlocal nomodifiable
    execute l:buffer_input . 'wincmd w'
endfunction

