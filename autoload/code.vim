"=============================================================================
"
" code.vim
"
" Personal coding utilities.
"
" TODO
" ----
"
" - implement an indent/unindent for block comments
" - implement align on char ("=") for enums/dictionaries/variable lists
" - implement argument/literal text objects
" - implement argument/literal line splitter/joiner
" - implement argument/literal position swapper/shifter
" - implement right-hand-side comment reformat/reflow
" - implement snake-case/camel-case part text objects (plugin exists)
"
"=============================================================================

"-----------------------------------------------------------------------------
" Private Functions
"-----------------------------------------------------------------------------

"=============================================================================
" Rips content text from a single-line comment string.
"=============================================================================
function! _rip_text( comment )

    " attempt to extract leading white space, delimiter, and content
    let l:pattern = '\v^(\s*)([#"/][/*]?)\s*(.{-})\s*(\*/)?\s*$'
    let l:matches = matchlist( a:comment, l:pattern )

    " check number of match groups
    if len( l:matches ) > 3

        " return the 1st, 2nd, and 3rd match groups
        return l:matches[ 1 : 3 ]

    endif

    " did not match extraction pattern
    return []

endfunction


"=============================================================================
" Starting at the given line, attempt to grab as much comment content as
" possible below the line.
" Return a dictionary containing the following items:
"   indent: the detected indent of the first comment
"   prefix: the detected line comment prefix
"   lines:  the content as list of strings (one item per line of comments)
"=============================================================================
function! _gather_comments( line )

    " set up a list of comment lines
    let l:comments = []

    " get and parse the given line in the buffer
    let l:first = _rip_text( getline( a:line ) )

    " verify the extraction worked
    if len( l:first ) != 3
        return {}
    endif

    " add the initial line of content
    call add( l:comments, l:first[ 2 ]  )

    " attempt to capture additional lines of comments below this one
    let l:line = a:line + 1
    while 1

        " get and parse the next line from the buffer
        let l:current = _rip_text( getline( l:line ) )

        " see if extraction worked
        if len( l:current ) == 0
            break
        endif

        " add this line to the content
        call add( l:comments, l:current[ 2 ] )

        " advance to the next line
        let l:line = l:line + 1

    endwhile

    " return the comment content items
    let l:items = {}
    let l:items.indent = l:first[ 0 ]
    let l:items.prefix = l:first[ 1 ]
    let l:items.lines  = l:comments
    return l:items

endfunction


"-----------------------------------------------------------------------------
" Public Functions
"-----------------------------------------------------------------------------

"=============================================================================
" Converts the current and all following single-line comments into a single
" block-style comment.
"
" @param line  Optional line number to begin formatting (default: current)
" @param width Optional right-hand column of blocks (default: &textwidth)
" @param char  Optional fill character for drawing block "bars" (default: "-")
"=============================================================================
function! code#CommentBlock( ... )

    " set the current line to begin editing
    let l:line = a:0 > 0 ? a:1 : line( '.' )

    " set the right-hand boundary for block comments
    let l:width = a:0 > 1 ? a:2 : &textwidth

    " set the fill character
    let l:char = a:0 > 2 ? a:3 : '-'

    " gather all comment contents starting at the current line
    let l:comments = _gather_comments( l:line )

    " verify we retrieved something
    if len( l:comments ) == 0
        return
    endif

    " calculate some metrics on what we found
    let l:num_lines = len( l:comments.lines )
    let l:end       = l:line + l:num_lines
    let l:idlen     = strlen( l:comments.indent )
    let l:pflen     = strlen( l:comments.prefix )
    let l:bar       = repeat( l:char, ( l:width - l:idlen - l:pflen ) )

    " capitalize the first character of the first line
    let l:sub = l:comments.lines[ 0 ]
    let l:comments.lines[ 0 ] = toupper( l:sub[ 0 ] ) . l:sub[ 1 : ]

    " dot the end of the last line (if it isn't already)
    let l:sub = l:comments.lines[ -1 ]
    if l:sub[ -1 : ] != '.'
        let l:comments.lines[ -1 ] = l:sub . '.'
    endif

    " look for C-style comments
    if l:comments.prefix[ 0 ] == '/'
        let l:block_start = '/*' . l:bar
        let l:block_end   = l:bar . '*/'
        let l:cpf         = ''

    " assume single-character comment delimiter
    else
        let l:block_start = l:comments.prefix . l:bar
        let l:block_end   = l:block_start
        let l:cpf         = l:comments.prefix . ' '

    endif

    " place the starting comment bar before the current line
    call append( l:line - 1, l:comments.indent . l:block_start )

    " place the ending comment bar after the last line of comments
    call append( l:end, l:comments.indent . l:block_end )

    " advance the line number now that comments are pushed down one line
    let l:line = l:line + 1
    let l:end  = l:end + 1

    " iterate through the comment content
    let l:index = l:line
    let l:pline = ''
    for l:cline in l:comments.lines

        " attempt to sentence-case things that might need it
        if l:pline[ -1 : ] == '.'
            let l:cline = toupper( l:cline[ 0 ] ) . l:cline[ 1 : ]
        endif
        let l:cline = substitute( l:cline, '\v\.(\s+\w)', '\.\U\1', 'g' )
        let l:pline = l:cline

        " replace the contents on each line with the parsed content
        call setline( l:index, l:comments.indent . l:cpf . l:cline )
        let l:index = l:index + 1

    endfor

    " save the textwidth setting, and modify it for our width
    let l:textwidth = &textwidth
    let &textwidth  = l:width

    " reflow the content in the block comment
    execute 'normal! gq' . l:num_lines . 'j'

    " restore the textwidth setting
    let &textwidth = l:textwidth

endfunction

