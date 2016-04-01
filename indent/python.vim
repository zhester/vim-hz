"=============================================================================
"
" python.vim
"
" Python Indent Script
"
" Much of this is derived from the built-in indent/python.vim.
"
"=============================================================================

"-----------------------------------------------------------------------------
" Script Boilerplate
"-----------------------------------------------------------------------------

" Do not keep reloading when indent features are already loaded.
if exists( 'b:did_indent' )
    finish
endif
let b:did_indent = 1

"-----------------------------------------------------------------------------
" Indent Settings
"-----------------------------------------------------------------------------

" Set defaults to hook into indent features.
setlocal nolisp
setlocal autoindent
setlocal indentexpr=HzPythonIndent(v:lnum)
setlocal indentkeys=!^F,o,O,0),0],0}

" Prevent needless script execution.
if exists( '*HzPythonIndent' )
    finish
endif

"-----------------------------------------------------------------------------
" Script Variables
"-----------------------------------------------------------------------------

" Map from opening to closing delimiters.
let s:delim_map = {
    \ '(' : ')',
    \ '[' : ']',
    \ '{' : '}'
\ }


"=============================================================================
" Retrieves the line number of the previous line of Python code.
"=============================================================================
function! s:prevcode( line_number )
    let l:current_number = a:line_number
    let l:limit_loop     = 50
    while ( l:limit_loop > 0 ) && ( l:current_number > 1 )
        let l:current_number = prevnonblank( l:current_number )
        if l:current_number == 0
            return 0
        elseif getline( l:current_number ) !~ '^\s*#'
            return l:current_number
        endif
        let l:current_number -= 1
        let l:limit_loop     -= 1
    endwhile
    return 0
endfunction


"=============================================================================
" Determines the appropriate indentation for the given line.
"=============================================================================
function! HzPythonIndent( line_number )

    " Get the syntax at the start of the line.
    let l:start_syntax = synIDattr( synID( a:line_number, 1, 1 ), 'name' )

    " Check for indentation within string literal (docstrings).
    if l:start_syntax =~ 'String$'
        return 0
    endif

    " Line number of the previous line of code.
    let l:previous_line_number = s:prevcode( a:line_number - 1 )

    " Edge case for no previous lines of code.
    if l:previous_line_number == 0
        return 0
    endif

    " Get the previous line of code, and strip trailing comment/whitespace.
    let l:line = getline( l:previous_line_number )
    let l:line = substitute( l:line, '\s*\(#.*\)\?$', '', '' )

    " Compute the indent for a potential block of code.
    let l:previous_indent = indent( l:previous_line_number )
    let l:block_indent    = l:previous_indent + shiftwidth()
    let l:indent          = -1

    " Did the previous line start a block or continue to this line?
    if l:line =~ '[:\\]$'
        let l:indent = l:block_indent

    " Did the previous line start a literal or argument list?
    elseif l:line =~ '[\(\[\{]$'

        " Determine the closing delimiter.
        let l:close = s:delim_map[ l:line[ len( l:line ) - 1 ] ]

        " See if the user started the line with a closing delimiter.
        if getline( a:line_number ) =~ '^\s*' . l:close

            " Match the previous line's indentation.
            let l:indent = l:previous_indent

        else

            " Assume this is the contents of the literal/argument list.
            let l:indent = l:block_indent

        endif

    endif

    " Return the amount needed to indent.
    return l:indent

endfunction

