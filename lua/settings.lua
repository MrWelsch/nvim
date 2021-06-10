-- VIM BASE CONFIG
-- For information of each function use
-- :h <functionname>
vim.cmd('set iskeyword+=-')
vim.cmd('set shortmess+=c')
vim.cmd('set inccommand=split')
vim.o.hidden = O.hidden_files
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"

vim.wo.wrap = O.wrap_lines
vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd('syntax on')
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
vim.wo.number = O.number
vim.wo.relativenumber = O.relative_number
vim.wo.cursorline = false
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.wo.signcolumn = "yes"
vim.o.updatetime = 300
vim.o.timeoutlen = O.timeoutlen
vim.o.clipboard = "unnamedplus"
vim.cmd('filetype plugin on')
vim.o.colorcolumn = '80'

vim.g.nvim_tree_disable_netrw = O.nvim_tree_disable_netrw -- enable netrw for remote gx gf support (must be set before plugin's packadd)
vim.g.loaded_netrwPlugin = 1 -- needed for netrw gx command to open remote links in browser
