-- VIM BASE CONFIG
-- For information on each function use
-- :h <functionname>

local o = vim.opt

-- GENERAL
o.hidden = true
o.undofile = true
o.undodir = "~/.vim/undodir"
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
vim.cmd('set iskeyword+=-')
vim.cmd('set shortmess+=c')
vim.cmd('set whichwrap+=<,>,[,],h,l')

-- GLOBAL
--vim.g.nvim_tree_disable_netrw = 'O' -- enable netrw for remote gx gf support (must be set before plugin's packadd)
vim.g.loaded_netrwPlugin = 1 -- needed for netrw gx command to open remote links in browser
vim.g.nvim_tree_disable_netrw = 0
vim.g.auto_close_tree = 0
vim.g.auto_complete = true
vim.g.noswapfile = true
vim.g.nobackup = true

vim.g.vimtex_compiler_latexmk_engines = {
	['_'] = '-xelatex',
}

-- Remove trailing whitespace on save
-- autocmd BufWritePre * %s/\s\+$//e
