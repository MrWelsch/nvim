" Set <leader> key to <Space>
let mapleader = " "
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" GENERAL keybinds
" Tab to complete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Map Tab in normal mode to clear search highlight
map <Tab> :noh<CR>
" Map Esc to exit Terminal
tnoremap <Esc> <C-\><C-n>
" Remap TabSwitch
nnoremap <C-Left> :bprev<CR>
nnoremap <C-Right> :bnext<CR>
" Show full path, always
nnoremap <C-G> 1<C-G>
" Disable arrow keys, coz I needs to learn
map <Up> <Nop>
" map! <Up> <Nop>
map <Down> <Nop>
" map! <Down> <Nop>
map <Left> <Nop>
" map! <Left> <Nop>
map <Right> <Nop>
" map! <Right> <Nop>"

" COC keybinds
" Navigate to References etc.
nmap <> <Plug>(coc-definition)
nmap <> <Plug>(coc-type-definition)
nmap <> <Plug>(coc-implementation)
nmap <> <Plug>(coc-references)
" Navigate diagnostics
nmap <> <Plug>(coc-diagnostic-prev)
nmap <> <Plug>(coc-diagnostic-next)
" Apply AutoFix to problem on the current line.
nmap <> <Plug>(coc-fix-current)

" SIGNIFY keybinds
" Jump though hunks
nmap <> <Plug>(signify-next-hunk)
nmap <> <Plug>(signify-prev-hunk)
"nmap <leader>gJ 9999<leader>gJ
"nmap <leader>gK 9999<leader>gk

" VIMSPECTOR keybinds
nmap <> <Plug>VimspectorStop
nmap <> <Plug>VimspectorRestart
nmap <> <Plug>VimspectorContinue
nmap <> <Plug>VimspectorPause
nmap <> <Plug>VimspectorAddFunctionBreakpoint
nmap <> <Plug>VimspectorToggleBreakpoint
nmap <> <Plug>VimspectorStepOver
nmap <> <Plug>VimspectorStepInto
nmap <> <Plug>VimspectorStepOut
