"=============================================================================
"
" memory.vim
"
" Offloads brain memory into Vim memory.
"
"=============================================================================

"-----------------------------------------------------------------------------
" My Memories
"
" General format:
"
"    plugin, description (mode): keystrokes
"
" Note: "Vim" indicates this is core functionality.
" Note: The "*" indicates this is a custom thing in my `.vimrc`.
"-----------------------------------------------------------------------------

let s:leader = '<Space>'

let s:memory = [
\   'CtrlP*, enumerate MRU: ' . s:leader . 'P',
\   'Gundu*, toggle history browser: ' . s:leader . 'g',
\   'snipMate, enumerate snippets: i<C-r><Tab>',
\   'taglist*, toggle tag browser: ' . s:leader . 't',
\   'vim-fugitive, git status: Gstatus',
\   'vim-fugitive, browse blobs: Gedit',
\   'vim-fugitive, view diffs: Gdiff',
\   'vim-hz*, formalize comment: ' . s:leader . 'm',
\   'vim-hz*, split line: ' . s:leader . 'j',
\   'vim-surround*, surround word +: ' . s:leader . 'S',
\   'vim-surround, surround visual selection with quotes: S"',
\   'Vim*, search all open buffers: ' . s:leader . 'fb',
\   'Vim*, browse `pwd`: ' . s:leader . 'b',
\   'Vim*, "explore" `pwd`: ' . s:leader . 'B',
\   'Vim*, list buffers: ' . s:leader . 'l',
\   'Vim*, start diff on windowed buffers: ' . s:leader . 'd',
\   'Vim*, interactive search: ' . s:leader . 'fi',
\   'Vim*, trim trailing whitespace: ' . s:leader . 'r',
\   'Vim*, paste from clipboard: ' . s:leader . 'cp',
\   'Vim*, decimal to hex: ' . s:leader . 'h',
\   'Vim*, search all files in `pwd`: ' . s:leader . 'fi',
\   'Vim*, open|close quickfix window: ' . s:leader . 'fo|c',
\   'Vim*, filter buffer through `xxd`: ' . s:leader . 'x',
\   'Vim*, copy to clipboard: ' . s:leader . 'cc',
\   'Vim*, hex to decimal: ' . s:leader . 'H',
\   'Vim*, cycle open buffers (normal): <Tab>',
\   'Vim*, reload `.vimrc`: <F2>',
\   'Vim*, reload `.vimrc`: <F2>',
\   'Vim, re-flow selected text: gq',
\   'Vim, paste register into command: <C-r>"',
\   'Vim, >word|WORD;<word|WORD: w|W;b|B',
\   'Vim, >block;<block: {;}',
\   'Vim, repeat jump next|previous: ;|,',
\   'Vim, enumerate marks: :marks',
\   'Vim, go to definition: <C-]>',
\   'Vim, go to definition in new window: <C-w>',
\   'Vim, return from jump: <C-t>',
\   'Vim, re-select previous visual selection: gv',
\   'Vim, paste over word under cursor: viwp',
\   'Vim, open file under cursor: gf',
\   'Vim, move to next|previous diff: ]c|[c',
\   'Vim, get|put change from|to other buffer: do|dp',
\   'Vim, start recording macro X|stop recording: qX|q',
\   'Vim, play macro X: @X',
\   'Vim, replay last macro: @@',
\   'Vim, copy output of command to buffer: :r !cmd',
\   'Vim, enumerate spelling suggestions: z=',
\]


"=============================================================================
" Retrieves the memory of the day.
"
" @return A string representing today's memory
"=============================================================================
function! memory#OfTheDay()
    let l:today        = strftime( '%j' )
    let l:num_memories = len( s:memory )
    let l:index        = l:today % l:num_memories
    return s:memory[ l:index ]
endfunction


"=============================================================================
" Retrieves a random memory.
"
" @return A string representing a random memory
"=============================================================================
function! memory#Random()
    let l:random       = memory#RandomNumber()
    let l:num_memories = len( s:memory )
    let l:index        = l:random % l:num_memories
    return s:memory[ l:index ] " . ' [' . l:index . '](' . l:random . ')'
endfunction


"=============================================================================
" Produce fairly random numbers.
"
" @return A fairly random number between 0 and a large integer (>16 bits)
"=============================================================================
function! memory#RandomNumber()
    let l:rtime = reltimestr( reltime() )
    return str2nr( matchstr( l:rtime, '\v\.@<=\d+' )[ 1 : ] )
endfunction

