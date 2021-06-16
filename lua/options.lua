-- VIM BASE CONFIG
-- For information on each function use
-- :h <functionname>

local o = vim.opt
local cmd = vim.cmd

-- GENERAL
o.hidden = true
o.undofile = true
o.undodir = "/Users/nico/.cache/nvim/undodir"
o.mouse = "n"
o.clipboard = "unnamedplus"
o.inccommand = "split"
o.signcolumn = "yes"
o.belloff = "all"
o.completeopt = "menuone,noselect"

-- PERFORMANCE
o.updatetime = 300
o.timeoutlen = 100

-- VISUAL
o.termguicolors = true
o.cmdheight = 2
o.showmode = false
o.number = true
o.relativenumber = true
o.cursorline = false
o.fillchars = { eob = " " }

-- EDITOR
o.splitbelow = true
o.splitright = true

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

o.smartindent = true

o.hlsearch = false
o.incsearch = true

o.wrap = false
o.textwidth = 80
o.colorcolumn = '80'

o.scrolloff = 10
-- o.showmatch = true -- shows matching brackets

-- VIM COMMAND
cmd('set iskeyword+=-')
cmd('set shortmess+=c')
cmd('set whichwrap+=<,>,[,],h,l')

-- GLOBAL
vim.g.auto_complete = true
vim.g.noswapfile = true
vim.g.nobackup = true

-- Remove trailing whitespace on save
-- autocmd BufWritePre * %s/\s\+$//e
