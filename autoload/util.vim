"=============================================================================
"
" util.vim
"
" Utilities Implemented in Vim
"
"=============================================================================

"-----------------------------------------------------------------------------
" Public Functions
"-----------------------------------------------------------------------------

"=============================================================================
" Retrieves a list of files in the current or given directory.
"=============================================================================
function! util#GetList( ... )

    " Check for specified or current directory to list.
    let l:dir = a:0 > 0 && !empty( a:1 ) ? a:1 : getcwd()

    " Load list of files.
    let l:command = '\ls ' . shellescape( l:dir )
    let l:list = system( l:command )
    let l:nodes = split( l:list )
    call sort( l:nodes )

    " Return list of files.
    return l:nodes

endfunction


"=============================================================================
" Lists files and directories in the current or given directory.
"=============================================================================
function! util#List( ... )

    " Check for specified or current directory to list.
    let l:dir = a:0 > 0 && !empty( a:1 ) ? a:1 : getcwd()

    " Load list of files.
    let l:nodes = util#GetList( l:dir )

    " Get first line.
    let l:lnum = line( '.' )

    " Append directory name to buffer.
    call append( l:lnum, l:dir )
    let l:lnum += 1

    " Append list of files to buffer.
    for l:node in l:nodes
        call append( l:lnum, l:node )
        let l:lnum += 1
    endfor

endfunction


"=============================================================================
" Lists files and directories in the current or given directory in two
" columns to assist with renaming.
"=============================================================================
function! util#ListPairs( ... )

    " Check for specified or current directory to list.
    let l:dir = a:0 > 0 && !empty( a:1 ) ? a:1 : getcwd()

    " Load list of files.
    let l:nodes = util#GetList( l:dir )

    " Get length of longest name.
    let l:longest = 1
    for l:node in l:nodes
        let l:length = strlen( l:node )
        if l:longest < l:length
            let l:longest = l:length
        endif
    endfor

    " Set the output string format.
    let l:fmt = '%s %' . l:longest . 's'

    " Get first line.
    let l:lnum = line( '.' )

    " Append directory name to buffer.
    call append( l:lnum, l:dir )
    let l:lnum += 1

    " Append duplicated list of files to buffer.
    for l:node in l:nodes
        call append( l:lnum, printf( l:fmt, l:node, l:node ) )
        let l:lnum += 1
    endfor

endfunction


"=============================================================================
" Executes a file renaming job based on the contents of the buffer.
"=============================================================================
function! util#RenamePairs( line1, line2 )

    " Read the renaming list from the buffer.
    let l:rename = getline( a:line1, a:line2 )

    " The first line should contain the directory.
    let l:dir = l:rename[ 0 ]

    " If the directory looks like a renaming pair, assume each pair contains
    " all the path information needed for the rename.
    if l:dir =~ '[^\] '
        let l:dir   = ''
        let l:pairs = l:rename
    else
        let l:dir   = l:dir . '/'
        let l:pairs = l:rename[ 1 : ]
    endif

    " Current line number.
    let l:lnum = line( '.' )

    " Stats.
    let l:renamed = 0

    " Iterate through each file name pair.
    for l:pair in l:pairs

        " Break the pair apart.
        let l:parts = split( l:pair )

        " Check for need to rename.
        if l:parts[ 0 ] != l:parts[ 1 ]

            " Construct rename command.
            let l:command = '\mv -i ' .
                \ shellescape( l:dir . l:parts[ 0 ] ) . ' ' .
                \ shellescape( l:dir . l:parts[ 1 ] )

            " Feedback.
            "call append( l:lnum, l:command )
            "let l:lnum += 1

            " Rename the file.
            call system( l:command )
            let l:renamed += 1

        endif

    endfor

    " Feedback.
    echo 'Renamed ' . l:renamed . ' files.'

endfunction

