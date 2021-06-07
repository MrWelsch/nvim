
" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
" Show Window Vertically
let g:which_key_vertical = 1

" Change the colors if you want
highlight default link WhichKey          Number
highlight default link WhichKeySeperator Operator
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map.e = [ ':CocCommand explorer' , 'EXPLORER' ]
let g:which_key_map.h = [ ':Startify'            , 'HOME' ]

" w is for window
let g:which_key_map.w = {
      \ 'name' : '+WINDOWS' ,
      \ 'w' : ['<C-W>w'     , 'OTHER']          ,
      \ 'd' : ['<C-W>c'     , 'DELETE']         ,
      \ '-' : ['<C-W>s'     , 'SPLIT BELOW']    ,
      \ '|' : ['<C-W>v'     , 'SPLIT RIGHT']    ,
      \ '2' : ['<C-W>v'     , 'DOUBLE COLUMNS'] ,
      \ 'h' : ['<C-W>h'     , 'LEFT']           ,
      \ 'j' : ['<C-W>j'     , 'BELOW']          ,
      \ 'l' : ['<C-W>l'     , 'RIGHT']          ,
      \ 'k' : ['<C-W>k'     , 'UP']             ,
      \ 'H' : ['<C-W>5<'    , 'EXPAND LEFT']    ,
      \ 'J' : ['resize +5'  , 'EXPAND BELOW']   ,
      \ 'L' : ['<C-W>5>'    , 'EXPAND RIGHT']   ,
      \ 'K' : ['resize -5'  , 'EXPAND UP']      ,
      \ '=' : ['<C-W>='     , 'BALANCE']        ,
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+BUFFERS' ,
      \ '1' : ['b1'        , 'BUFFER 1']        ,
      \ '2' : ['b2'        , 'BUFFER 1']        ,
      \ 'd' : ['bd'        , 'DELETE']          ,
      \ 'h' : ['Startify'  , 'HOME']            ,
      \ 'f' : ['bfirst'    , 'FIRST BUFFER']    ,
      \ 'l' : ['blast'     , 'LAST BUFFER']     ,
      \ 'n' : ['bnext'     , 'NEXT']            ,
      \ 'p' : ['bprevious' , 'PREVIOUS']        ,
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+SEARCH' ,
      \ '/' : [':History/'     , 'HISTORY'],
      \ ';' : [':Commands'     , 'COMMANDS'],
      \ 'a' : [':Ag'           , 'TEXT Ag'],
      \ 'b' : [':BLines'       , 'CURRENT BUFFER'],
      \ 'B' : [':Buffers'      , 'ALL BUFFERS'],
      \ 'c' : [':Commits'      , 'COMMITS'],
      \ 'C' : [':BCommits'     , 'BUFFER COMMITS'],
      \ 'f' : [':Files'        , 'FILES'],
      \ 'g' : [':GFiles'       , 'GIT FILES'],
      \ 'G' : [':GFiles?'      , 'MODIFIED GIT FILES'],
      \ 'h' : [':History'      , 'FILE HISTORY'],
      \ 'H' : [':History:'     , 'COMMAND HISTORY'],
      \ 'l' : [':Lines'        , 'LINES'] ,
      \ 'm' : [':Marks'        , 'MARKS'] ,
      \ 'M' : [':Maps'         , 'NORMAL MAPS'] ,
      \ 'p' : [':Helptags'     , 'HELP TAGS'] ,
      \ 'P' : [':Tags'         , 'PROJECT TAGS'],
      \ 's' : [':Snippets'     , 'SNIPPETS'],
      \ 'S' : [':Colors'       , 'COLOR THEMES'],
      \ 't' : [':Rg'           , 'TEXT Rg'],
      \ 'T' : [':BTags'        , 'BUFFER TAGS'],
      \ 'w' : [':Windows'      , 'WINDOWS'],
      \ 'y' : [':Filetypes'    , 'FILETYPES'],
      \ }

" t is for terminal (Things to be opened in a floating window)
let g:which_key_map.t = {
      \ 'name' : '+TERMINAL' ,
      \ ';' : [':FloatermNew'           , 'OPEN'],
      \ 't' : [':FloatermToggle'        , 'TOGGLE'],
      \ }

" c is for COC
let g:which_key_map.c = {
      \ 'name' : '+COC' ,
      \ 'a' : [':CocAction'                     , 'ACTION'],
      \ 'f' : ['<Plug>(coc-fix-current)'        , 'FIX'],
      \ 'F' : [':Format'                        , 'FORMAT'],
      \ 'e' : [':CocList diagnostics'           , 'ERRORS'],
      \ 'c' : [':CocList commands'              , 'COMMANDS'],
      \ 'j' : ['<Plug>(coc-diagnostic-prev)'    , 'ERRPREV'],
      \ 'k' : ['<Plug>(coc-diagnostic-next)'    , 'ERRNEXT'],
      \ 'i' : ['<Plug>(coc-implementation)'     , 'IMPLEMENTATION'],
      \ 'r' : ['<Plug>(coc-references)'         , 'REFERENCES'],
      \ 'd' : ['<Plug>(coc-definition)'         , 'DEFINITION'],
      \ 't' : ['<Plug>(coc-type-definition)'    , 'TYPEDEF'],
      \ }

" g is for git
"let g:which_key_map.g = {
"      \ 'name' : '+git' ,
"      \ 'j' : ['<Plug>(signify-prev-hunk)'  , 'prev hunk'],
"      \ 'k' : ['<Plug>(signify-next-hunk)'  , 'next hunk'],
"      \ 'c' : [':SignifyDiff'               , 'changes'],
"     \ 'g' : [':FloatermNew lazygit'       , 'git'],
      \ }

" l is for latex
let g:which_key_map.l = {
      \ 'name' : '+LATEX' ,
      \ 'i' : [':VimtexInfo'      , 'INFO'],
      \ 't' : [':VimtexTocToggle' , 'TOC'],
      \ 'c' : [':VimtexCompile'   , 'COMPILE'],
      \ 's' : [':VimtexStop'      , 'STOP'],
      \ 'v' : [':VimtexView'      , 'PREVIEW'],
      \ 'C' : [':VimtexClean'     , 'CLEAN'],
      \ }

" j is for javascript
let g:which_key_map.j = {
      \ 'name' : '+JS' ,
      \ 'v' : [':Bracey'        , 'PREVIEW'],
      \ 's' : [':BraceyStop'    , 'STOP'],
      \ 'r' : [':BraceyReload'  , 'RELOAD'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
