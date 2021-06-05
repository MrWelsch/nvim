" Enable syntax and plugins
syntax enable
filetype on
filetype plugin on
filetype indent on
" Set encoding
set encoding=utf8
" Set mouse
set mouse=a
" Set colors
set termguicolors
" Hide mode (shown in status line)
set noshowmode
" When a file has been changed outside of Vim, automatically read it again
set autoread
" Always show current position
set ruler
" When a bracket is inserted, briefly jump to the matching one
set showmatch
" Tenths of a second to show the matching paren
set mat=2
" Switching this option off most likely breaks plugins, someone told me...
set magic
" Highlight search results
set hlsearch
" Number of columns occupied by a tab character
set tabstop=4
" Softtabstop == tabstop, noexpandtab && always force use of tabs
set expandtab
" Width for autoindents
set shiftwidth=4
" Indent a new line the same amount as the line just typed
set autoindent
" Add line numbers
set relativenumber number
" Prevent cursor to jump around too much on scroll
set lazyredraw
" Sets unix as standard filetype
set ffs=unix,dos,mac
" Wrap lines
set wrap
" Set Textwidth
set textwidth=80
" Maximum items in completion suggest popup menu
set pumheight=10
" Set timeoutlen (Default=1000)
set timeoutlen=500
" default updatetime 4000ms is not good for async update
set updatetime=100
" Don't make a any backups before overwriting a file
set nobackup
set nowritebackup
" Don't use a swapfile for the buffer
set noswapfile
" Increase max memory to show syntax highlighting for large files
set maxmempattern=20000
" Don't show preview [sratch] window
set completeopt-=preview
" Set list characters
set list
set listchars=
set listchars+=tab:›\ ,
set listchars+=trail:•,
" Set end of buffer and vertsplit to empty
set fillchars+=eob:\ ,
set fillchars+=vert:\ ,
" LIGHTLINE
set laststatus=2
set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline

" Don't show signcolumn
" set signcolumn=no

"###########################"
"###### FINDING FILES ######"
"###########################"

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
" Exclude node_modules when using e.g. :find
set wildignore+=**/node_modules/**

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer
