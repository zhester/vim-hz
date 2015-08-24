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
" Note: `*` indicates this is a custom thing in my `.vimrc`.
" Note: `|` implies alternation or options
" Note: `;` implies semantic separation
"-----------------------------------------------------------------------------

let s:leader = '<Space>'

let s:memory = [
\   'snipMate, enumerate snippets: i<C-r><Tab>',
\   'vim-fugitive, git status: Gstatus',
\   'vim-fugitive, browse blobs: Gedit',
\   'vim-fugitive, view diffs: Gdiff',
\   'vim-surround, surround selection with quotes: S"',
\   "vim-surround, change quotes from ' to \": cs\"'",
\   'vim-surround, remove \" quotes: ds"',
\   'vim-surround, surround word with <tag>: yss<tag>',
\   'vim-surround, surround selection with <tag>: S<tag>',
\   'Vim*, browse `pwd`: ' . s:leader . 'b',
\   'Vim*, "explore" `pwd`: ' . s:leader . 'B',
\   'Vim*, copy to clipboard: ' . s:leader . 'cc',
\   'Vim*, paste from clipboard: ' . s:leader . 'cp',
\   'Vim*, start|stop diff on windowed buffers: ' . s:leader . 'd|D',
\   'Vim*, search all open buffers: ' . s:leader . 'fb',
\   'Vim*, interactive search: ' . s:leader . 'fi',
\   'Vim*, open|close quickfix window: ' . s:leader . 'fo|c',
\   'Gundu*, toggle history browser: ' . s:leader . 'g',
\   'Vim*, decimal to hex: ' . s:leader . 'h',
\   'Vim*, hex to decimal: ' . s:leader . 'H',
\   'vim-hz*, split line: ' . s:leader . 'j',
\   'Vim*, enumerate buffers: ' . s:leader . 'l',
\   'vim-hz*, formalize comment: ' . s:leader . 'm',
\   'CtrlP*, enumerate buffers: ' . s:leader . 'p',
\   'CtrlP*, enumerate MRU: ' . s:leader . 'P',
\   'Vim*, trim trailing whitespace: ' . s:leader . 'r',
\   'vim-surround*, surround word +: ' . s:leader . 'S',
\   'taglist*, toggle tag browser: ' . s:leader . 't',
\   'Vundle, install and/or update plugins: ' . s:leader . 'v',
\   'Vim*, bootstrap Vundle: ' . s:leader . 'V',
\   'Vim*, filter buffer through `xxd`: ' . s:leader . 'x',
\   'Vim*, cycle open buffers (nrm): <Tab>',
\   'Vim*, reload .vimrc: <F2>',
\   'Vim*, start of text;line;line: 0;|;^',
\   'Vim, end of text;line: -;$',
\   'Vim, re-flow selected text: gq',
\   'Vim, >word|WORD;<word|WORD: w|W;b|B',
\   'Vim, >block;<block: {;}',
\   'Vim, repeat jump next|previous: ;|,',
\   'Vim, enumerate marks: :marks',
\   "Vim, create|jump to mark X: m|'X",
\   'Vim, go to definition: <C-]>',
\   'Vim, go to definition in new window: <C-w>',
\   'Vim, return from jump: <C-t>',
\   'Vim, re-select previous visual selection: gv',
\   'Vim, paste over word under cursor: viwp',
\   'Vim, open file under cursor: gf',
\   'Vim, move to next|previous diff: ]c|[c',
\   'Vim, get|put change from|to other buffer: do|dp',
\   'Vim, start recording macro X;stop recording: qX;q',
\   'Vim, play macro X: @X',
\   'Vim, replay last macro: @@',
\   'Vim, copy output of command to buffer: :r !cmd',
\   'Vim, enumerate spelling suggestions: z=',
\   'Vim, enumerate contents of registers: :reg',
\   'Vim, insert results of expressions/formulas (ins|ex): <C-r>=',
\   'Vim, insert contents of default register (ins|ex): <C-r>"',
\   'Vim, re-do last undone change (nrm): <C-r>',
\   'Vim, invert;upper;lower case: ~;U;u',
\   'Vim, disable highlighted search results: :noh',
\   'Vim, confirm search/replace: :s/PATTERN/REPLACEMENT/cg',
\   'Vim, search/replace confirm;skip;all;quit: y;n;a;q',
\   'Vim, insert contents of last insertion (ins): <C-a>',
\   'Vim, insert contents of X register (ins): <C-r>X',
\   'Vim, generic complete previous|next (ins): <C-p>|<C-n>',
\   'Vim, complete from tag list (ins): <C-x><C-]>',
\   'Vim, complete from files (ins): <C-x><C-f>',
\   'Vim, complete line (repeat for next line) (ins): <C-x><C-l>',
\   'Vim, navigate back|forward in jump list: <C-o>|<C-i>',
\   'Vim, yank word under cursor: yiw',
\   'Vim, replace word under cursor: viwp',
\   'Vim, sort selected lines: :sort',
\   'Vim, re-format selected code: =',
\   'Vim, convert tabs to spaces: :retab',
\   'Vim, append current range/selection to file.txt: :w! >> file.txt',
\]


"-----------------------------------------------------------------------------
" Other stuff I want to keep, but not in the list.
"-----------------------------------------------------------------------------

"\   "Vim, constrain EXPR between marks A and B: :'A,'BEXPR",
"\   "Vim, constrain EXPR within visual selection: :'<,'>EXPR",
"\   'Vim, break long lines to 20 columns below cursor: gq20G',
"\   'Vim, indent|un-indent current line: >>|<<',
"\   'Vim, swap between current and last buffer: <C-6>',
"\   'Vim, horizontal|vertical windows: :split|vsplit',
"\   'Vim, switch windows up|right|down|left: <C-w>k|l|j|h',
"\   'Vim, close all other splits: :only',
"\   'Vim, diff two current buffers in splits: :windo diffthis',
"\   'Vim, diff current buffer against file.txt: :diffsplit file.txt',
"\   'Vim, exit diff session: :diffoff',
"\   'Vim, auto-complete closing tag (ins): </<C-x><C-o>',
"\   'Vim, list syntax names: :hi',
"\   'Vim, list loaded scripts: :scriptnames',
"\   'Vim, dump key map: :redir! > keys.txt | verbose map | redir END',
"\   'Vim, switch to shell: :shell',
"\   'Vim, run a shell command CMD: :!CMD',
"\   'Vim, run the last shell command: :!!',
"\   'Vim, run a shell command, and insert stdout into buffer: :r !CMD',
"\   'Vim, remap key for all modes, recursively: :map {key} {action}',
"\   'Vim, remap key for all modes, non-recursively: :noremap {key} {action}',
"\   'Vim, remap key for normal mode, recursively: :nmap {key} {action}',
"\   'Vim, remap key for normal mode, non-recursively: :nnoremap {key} {action}',
"\   'Vim, key mapping mode prefixes: n,i,v,s,x',
"\   'Vim, scroll page up|down: <C-u>|<C-d>',
"\   'Vim*, execute script on line|selection: ' . s:leader . 'e',
"\   'Vim*, display syntax names: ' . s:leader . 'y',
"\   'Vim*, reload syntax highlighting: <F3>',
"\   'Vim*, toggle search highlighting: <F6>',
"\   'Vim*, toggle line wrapping: <F7>',
"\   'Vim*, toggle spell checking: <F8>',
"\   'Vim*, toggle paste-mode insertion: <F9>',

"-----------------------------------------------------------------------------
" Other Notes:
"
" Need a handy way to remember sub-commands:
"   CtrlP, Up|down in lists: <C-k>|<C-j>
"   vim-fugitive, Toggle staging (add/remove): -
"-----------------------------------------------------------------------------


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


"=============================================================================
" Searches through the memory list for a match.
"
" @return A string containing one or more lines of memories that match the
"         requested pattern
"         If the pattern is not matched, a message surrounded in parenthesis
"         is returned
"=============================================================================
function! memory#Search( pattern )

    " Establish a list of matched array items.
    let l:matches = []

    " Iterate through each item in the list.
    for l:memory in s:memory

        " Test this item for a match against the user's pattern.
        let l:result = match( l:memory, a:pattern )

        " Test the returned string offset for a match.
        if l:result != -1

            " Append the matched item to the list of matches.
            let l:matches = add( l:matches, l:memory )

        endif

    endfor

    " Count the total number of matched items.
    let l:num_matches = len( l:matches )

    " If there are matches, return a joined list of matches.
    if l:num_matches > 0
        return join( l:matches, "\n" )

    " No matches, return a helpful message.
    else
        return '(No match for "' . a:pattern . '")'

    endif

endfunction

