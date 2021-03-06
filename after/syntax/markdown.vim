"############################################################################
"
" Adjustments to Markdown Syntax Highlighting
"
"############################################################################

" Make headings stand out more.
hi markdownH1                   cterm=none      ctermbg=none    ctermfg=15
hi markdownH2                   cterm=none      ctermbg=none    ctermfg=3
hi markdownH3                   cterm=none      ctermbg=none    ctermfg=9
hi markdownH4                   cterm=none      ctermbg=none    ctermfg=1
hi markdownH5                   cterm=none      ctermbg=none    ctermfg=1
hi markdownH6                   cterm=none      ctermbg=none    ctermfg=1

" Normalize the heading rules and delimiters.
hi markdownHeadingRule          cterm=none      ctermbg=none    ctermfg=14
hi markdownHeadingDelimiter     cterm=none      ctermbg=none    ctermfg=14

" Make bold and italic look better.
hi markdownBold                 cterm=none      ctermbg=none    ctermfg=6
hi markdownItalic               cterm=none      ctermbg=none    ctermfg=6

" Adjust the list markers.
hi markdownListMarker           cterm=none      ctermbg=none    ctermfg=4
hi markdownOrderedListMarker    cterm=none      ctermbg=none    ctermfg=4

" Make code fragments and blocks a little different from normal text.
hi markdownCode                 cterm=none      ctermbg=none        ctermfg=14
hi markdownCodeDelimiter        cterm=none      ctermbg=none        ctermfg=1
hi markdownCodeBlock            cterm=none      ctermbg=none        ctermfg=14

