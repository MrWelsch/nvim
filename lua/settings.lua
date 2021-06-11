-- VIM BASE CONFIG
-- For information of each function use
-- :h <functionname>
vim.cmd('set iskeyword+=-')
vim.cmd('set shortmess+=c')
vim.cmd('set inccommand=split')
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.hidden = true
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"

vim.wo.wrap = false
vim.cmd('set whichwrap+=<,>,[,],h,l')
-- vim.cmd('syntax on')
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 2
vim.cmd('set colorcolumn=99999')
vim.o.mouse = "a"
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.conceallevel = 0
vim.cmd('set ts=4')
vim.cmd('set sw=4')
vim.cmd('set expandtab')
vim.bo.smartindent = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = false
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.wo.signcolumn = "yes"
vim.o.updatetime = 300
vim.o.timeoutlen = 100
vim.o.clipboard = "unnamedplus"
vim.cmd('filetype plugin on')
vim.o.colorcolumn = '80'

vim.g.nvim_tree_disable_netrw = 'O' -- enable netrw for remote gx gf support (must be set before plugin's packadd)
vim.g.loaded_netrwPlugin = 1 -- needed for netrw gx command to open remote links in browser


vim.g.nvim_tree_disable_netrw = 0
vim.g.auto_close_tree = 0

vim.g.auto_complete = true

vim.g.undodir = '$HOME/.vim/undodir'
vim.g.undofile = true
vim.g.noswapfile = true
vim.g.nobackup = true

vim.g.scrolloff = 8
