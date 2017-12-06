"=============================================================================
"
" hz.vim
"
" Personal Development Plugin
"
"=============================================================================

"-----------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------

"-----------------------------------------------------------------------------
" Commands
"-----------------------------------------------------------------------------

" Save the buffer and close only this buffer (:wq for buffers).
cnoreabbrev bq update<bar>bdelete
cnoreabbrev bx update<bar>bdelete

" Comment formalizing command
command! CB call code#CommentBlock()
command! CS call code#CommentSentence()

" Custom hexadecimal conversion commands
command! -nargs=? -range D2H call code#d2h( <line1>, <line2>, '<args>' )
command! -nargs=? -range H2D call code#h2d( <line1>, <line2>, '<args>' )

" Snippet management commands
command! OpenSnippet :call dev#OpenSnippet()
command! OpenSnippets :call dev#OpenSnippet()
command! OS :call dev#OpenSnippet()

" File renaming utility commands
command! -nargs=? -complete=file ListPairs call util#ListPairs( '<args>' )
command! -nargs=? -complete=file LP call util#ListPairs( '<args>' )
command! -range RenamePairs call util#RenamePairs( <line1>, <line2> )
command! -range RP call util#RenamePairs( <line1>, <line2> )

" Run any shell command and read output into a temporary buffer.
command! -nargs=* -complete=shellcmd R
    \   new
    \ | setlocal buftype=nofile bufhidden=delete noswapfile
    \ | r !<args>

" Run Python on the file in the buffer and read output into temporary buffer.
command! -nargs=* P call shell#PyRun( <q-args> )

"-----------------------------------------------------------------------------
" Mappings
"-----------------------------------------------------------------------------

" Indent-level text object mappings
onoremap <silent>ai :<C-u>call code#VIndent(1)<CR>
onoremap <silent>ii :<C-u>call code#VIndent(0)<CR>
vnoremap <silent>ai :<C-u>call code#VIndent(1)<CR>
vnoremap <silent>ii :<C-u>call code#VIndent(0)<CR>

" Underscore symbol parts text object mappings
xnoremap <silent>iu :<C-u>call code#SeparatorObject('_',v:count1)<CR>
onoremap <silent>iu :call code#SeparatorObject('_',v:count1)<CR>
xnoremap <silent>au :<C-u>call code#SeparatorObject('_',v:count1,1)<CR>
onoremap <silent>au :call code#SeparatorObject('_',v:count1,1)<CR>

" Auto-create _some_ blocks in C-like syntaxes.
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap {<CR> {<CR>}<Esc>O

"-----------------------------------------------------------------------------
" Leader Mappings
"-----------------------------------------------------------------------------

" Put currently open buffers (in separate windows) in diff mode.
nnoremap <silent> <Leader>d :diffthis<CR>

" Disable diff mode.
nnoremap <silent> <Leader>D :diffoff<CR>

" Execute contents of current line or selection.
nnoremap <silent> <Leader>e "eyy:@e<CR>
vnoremap <silent> <Leader>e "ey:'<,'>@e<CR>

" Convert decimal numbers to hexadecimal.
nnoremap <silent> <Leader>h :D2H<CR>
vnoremap <silent> <Leader>h :'<,'>D2H<CR>

" Convert hexadecimal numbers to decimal.
nnoremap <silent> <Leader>H :H2D<CR>
vnoremap <silent> <Leader>H :'<,'>H2D<CR>

" Split the current line opposite the default join operation.
nnoremap <silent> <Leader>j :call code#SplitLine()<CR>

" Normalize quick-entry comments into nice-looking block comments.
nnoremap <silent> <Leader>m :call code#CommentBlock()<CR>
nnoremap <silent> <Leader>M :call code#CommentSentence()<CR>

" Toggle line numbering.
nnoremap <silent> <Leader>n :call display#ToggleNumber()<CR>

" Toggle relative line numbering.
nnoremap <silent> <Leader>N :call display#ToggleRelativeNumber()<CR>

" Trim trailing white sapce.
nnoremap <silent> <Leader>r :%s/\s\+$//ge<CR>
vnoremap <silent> <Leader>r <C-c>:%s/\%V\s\+$//ge<CR>

" Display syntax match groups.
nnoremap <silent> <Leader>z :echo dev#GetSyntax()<CR>

"-----------------------------------------------------------------------------
" Automation
"-----------------------------------------------------------------------------

if has( 'autocmd' )

    "-------------------------------------------------------------------------
    " Plugin autocommand group
    "-------------------------------------------------------------------------
    augroup hz
        autocmd!
    augroup END

    "-------------------------------------------------------------------------
    " Plugin autocommand registration
    "
    " Note: This will clear the editor's initial message that includes the
    "       starting file name (or "newfile"), the number of lines, and the
    "       number of characters in that file.
    "
    " Line-continuation doesn't allow for comments, so here's what this does:
    " 1. Display a heading using our PreProc highlight code.
    " 2. Display the tip of the day using the Type highlight code.
    " 3. Shut off highlighting in the message area.
    " 4. Force redraw to avoid the confirmation.
    "-------------------------------------------------------------------------
    "autocmd hz VimEnter *
    "    \ echohl PreProc | echon 'Tip of the day: ' |
    "    \ echohl Type | echon memory#OfTheDay() |
    "    \ echohl None |
    "    \ redraw

endif

"-----------------------------------------------------------------------------
" Test Code
"-----------------------------------------------------------------------------

" ProSnip testing command and mapping
command! PS call prosnip#Start()
inoremap <S-Tab> <C-o>:call prosnip#Start()<CR>

