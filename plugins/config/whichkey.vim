
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
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['e'] = [ ':CocCommand explorer' , 'EXPLORER' ]
let g:which_key_map['h'] = [ ':Startify'            , 'HOME' ]

" w is for window
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ }

" t is for terminal (Things to be opened in a floating window)
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew'           , 'terminal'],
      \ 't' : [':FloatermToggle'        , 'toggle'],
      \ }

" c is for COC
let g:which_key_map.c = {
      \ 'name' : '+coc' ,
      \ 'a' : [':CocAction'                     , 'action'],
      \ 'f' : ['<Plug>(coc-fix-current)'        , 'fix'],
      \ 'F' : [':Format'                        , 'format'],
      \ 'e' : [':CocList diagnostics'           , 'errors'],
      \ 'c' : [':CocList commands'              , 'commands'],
      \ 'j' : ['<Plug>(coc-diagnostic-prev)'    , 'errPrev'],
      \ 'k' : ['<Plug>(coc-diagnostic-next)'    , 'errNext'],
      \ 'i' : ['<Plug>(coc-implementation)'     , 'implementation'],
      \ 'r' : ['<Plug>(coc-references)'         , 'references'],
      \ 'd' : ['<Plug>(coc-definition)'         , 'definition'],
      \ 't' : ['<Plug>(coc-type-definition)'    , 'type definition'],
      \ }

" g is for git
"let g:which_key_map.g = {
"      \ 'name' : '+git' ,
"      \ 'j' : ['<Plug>(signify-prev-hunk)'  , 'prev hunk'],
"      \ 'k' : ['<Plug>(signify-next-hunk)'  , 'next hunk'],
"      \ 'c' : [':SignifyDiff'               , 'changes'],
"     \ 'g' : [':FloatermNew lazygit'       , 'git'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
