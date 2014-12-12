"############################################################################
"
" Custom Color Syntax Definition
"
" This is meant to allow quicker/simpler previewing of syntax colors.
"
"############################################################################

" Create the base matching expressions.
syn match colorsFG0 display 'FG0'
syn match colorsFG1 display 'FG1'
syn match colorsFG2 display 'FG2'
syn match colorsFG3 display 'FG3'
syn match colorsFG4 display 'FG4'
syn match colorsFG5 display 'FG5'
syn match colorsFG6 display 'FG6'
syn match colorsFG7 display 'FG7'
syn match colorsFG8 display 'FG8'
syn match colorsFG9 display 'FG9'
syn match colorsFGA display 'FGA'
syn match colorsFGB display 'FGB'
syn match colorsFGC display 'FGC'
syn match colorsFGD display 'FGD'
syn match colorsFGE display 'FGE'
syn match colorsFGF display 'FGF'

" Hard-code these groups to a color scheme (for now).
hi colorsFG0    cterm=none      ctermbg=none    ctermfg=0
hi colorsFG1    cterm=none      ctermbg=none    ctermfg=1
hi colorsFG2    cterm=none      ctermbg=none    ctermfg=2
hi colorsFG3    cterm=none      ctermbg=none    ctermfg=3
hi colorsFG4    cterm=none      ctermbg=none    ctermfg=4
hi colorsFG5    cterm=none      ctermbg=none    ctermfg=5
hi colorsFG6    cterm=none      ctermbg=none    ctermfg=6
hi colorsFG7    cterm=none      ctermbg=none    ctermfg=7
hi colorsFG8    cterm=none      ctermbg=none    ctermfg=8
hi colorsFG9    cterm=none      ctermbg=none    ctermfg=9
hi colorsFGA    cterm=none      ctermbg=none    ctermfg=10
hi colorsFGB    cterm=none      ctermbg=none    ctermfg=11
hi colorsFGC    cterm=none      ctermbg=none    ctermfg=12
hi colorsFGD    cterm=none      ctermbg=none    ctermfg=13
hi colorsFGE    cterm=none      ctermbg=none    ctermfg=14
hi colorsFGF    cterm=none      ctermbg=none    ctermfg=15

" Create background modifying patterns.
syn match colorsBGNone display 'background(\s*none\s*)\s*{[^}]*}'
syn match colorsBG0 display 'background(\s*0\s*)\s*{[^}]*}'

hi colorsBGNone cterm=none      ctermbg=none    ctermfg=none
hi colorsBG0    cterm=none      ctermbg=0       ctermfg=none

" A function for generating a color pallette display.
function! ColorsDraw()
    let num = 1
    let lnum = line( '.' )
    while num < 16
        exec 'hi colors_' . num . ' ctermbg=' . num . ' ctermfg=15'
        exec 'syn match colors_' . num . ' "# ' . num . ' #" containedIn=ALL'
        call append( ( lnum + ( num - 1 ) ), '# ' . num . ' #' )
        let num = num + 1
    endwhile
endfunction

