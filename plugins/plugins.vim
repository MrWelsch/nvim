" AUTOINSTALL PLUGIN-MANAGER
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.config/nvim/autoload/plugged')

" Start Screen
Plug 'mhinz/vim-startify'
" Status Bar
Plug 'itchyny/lightline.vim'
" Tabs
Plug 'taohexxx/lightline-buffer'
" File Icons
Plug 'ryanoasis/vim-devicons'
" Show Keybinds
Plug 'liuchengxu/vim-which-key'
" Floating Windows
Plug 'voldikss/vim-floaterm'
" Git Integration
Plug 'mhinz/vim-signify'
" Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'
" Code Completion, Linter, References, ...
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Latex
Plug 'lervag/vimtex'
" Colorizer
Plug 'norcalli/nvim-colorizer.lua'
" Live-Server
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

" Find Files (Requires at least Nvim Nightly 0.5)
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'


" Initialize plugin system
call plug#end()
