-- VIM BASE CONFIG
-- For information of each function use
-- :h <functionname>

local opt = vim.opt

opt.titlestring="%<%F%=%l/%L - nvim"
opt.hlsearch = false
opt.incsearch = true
opt.hidden = true
opt.title = true
opt.pumheight = 10
opt.fileencoding = "utf-8"
opt.cmdheight = 2
opt.mouse = "n"
opt.splitbelow = true
opt.termguicolors = true
opt.splitright = true
opt.conceallevel = 0
opt.showtabline = 2
opt.showmode = false
opt.backup = false
opt.writebackup = false
opt.updatetime = 1000
opt.timeoutlen = 100
opt.clipboard = "unnamedplus"
opt.colorcolumn = '80'
-- Tabs
--opt.autoindent = false
--opt.cindent = false
opt.wrap = false

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

--opt.breakindent = true
--opt.showbreak = string.rep(" ", 3)
--opt.linebreak = true

opt.inccommand = "split"

opt.number = true
opt.relativenumber = true
opt.cursorline = false
opt.signcolumn = "yes"
opt.smartindent = true
-- opt.showmatch = true -- shows matching brackets
opt.scrolloff = 10
opt.belloff = "all"
opt.fillchars = { eob = " " }

-- VIM COMMAND
TERMINAL = vim.fn.expand('$TERMINAL')

vim.cmd('let &titleold="'..TERMINAL..'"')
vim.cmd('set iskeyword+=-')
vim.cmd('set shortmess+=c')
vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd('set colorcolumn=99999')
vim.cmd('filetype plugin on')

-- GLOBAL
vim.g.nvim_tree_disable_netrw = 'O' -- enable netrw for remote gx gf support (must be set before plugin's packadd)
vim.g.loaded_netrwPlugin = 1 -- needed for netrw gx command to open remote links in browser
vim.g.nvim_tree_disable_netrw = 0
vim.g.auto_close_tree = 0
vim.g.auto_complete = true
vim.g.undodir = '$HOME/.vim/undodir'
vim.g.undofile = true
vim.g.noswapfile = true
vim.g.nobackup = true
