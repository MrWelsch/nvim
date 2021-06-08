" SOURCES
packadd! dracula_pro                                        " Theme
source $HOME/.config/nvim/general/settings.vim              " General
source $HOME/.config/nvim/keybinds/mappings.vim             " Keybinds
source $HOME/.config/nvim/plugins/plugins.vim               " Plugins
source $HOME/.config/nvim/plugins/config/lightline.vim      " LIGHTLINE settings
source $HOME/.config/nvim/plugins/config/startify.vim       " STARTIFY settings
source $HOME/.config/nvim/plugins/config/floaterm.vim       " FLOATERM settings
source $HOME/.config/nvim/plugins/config/whichkey.vim       " WHICHKEY settings
source $HOME/.config/nvim/plugins/config/coc.vim            " COC settings
source $HOME/.config/nvim/plugins/config/signify.vim        " SIGNIFY settings
source $HOME/.config/nvim/plugins/config/vimtex.vim         " VIMTEX settings
source $VIMRUNTIME/mswin.vim                                " Enable CopyPaste
" SOURCE LUA
lua require'plug-colorizer'

" COC EXTENSIONS WILL BE LOADED AFTER coc.nvim SERVICE STARTED
let g:coc_global_extensions = ['coc-explorer', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-python', 'coc-texlab']

" SYNTAX HIGHLIGHTING
" Java Guide Lines : style
" Indenting        : indent
let java_highlight_functions="style"

" DISABLE COLOR SCHEME BACKGROUND COLORS
highlight Normal ctermbg=none guibg=none
highlight SignColumn ctermbg=none guibg=none
highlight LineNr ctermbg=none guibg=none

" AUTOCMD'S, ETC
" Auto resize panes
autocmd VimResized * wincmd =
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
" CocExplorer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"Open coc-explorer if no file specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | coc-explorer | endif

syntax enable

let g:dracula_colorterm = 0

colorscheme dracula_pro
