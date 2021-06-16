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
--cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- GLOBAL
vim.g.auto_complete = true
vim.g.noswapfile = true
vim.g.nobackup = true

-- NVIM-TREE
-- Need to be set here, since they need to load before nvim-tree
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_auto_ignore_ft = 'dashboard'
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_side = 'right'

-- AUTOCOMMANDS
-- Define your autocommands table
--local my_autocommands = {
--	my_augroup_name = {
--	  'BufWritePost', '*', 'FormatWrite'
--	}
--}
-- Set Autocommands
-- https://github.com/norcalli/nvim_utils
--function create_augroups(definitions)
--    for group_name, definition in pairs(definitions) do
--        vim.api.nvim_command('augroup ' .. group_name)
--        vim.api.nvim_command('autocmd!')
--        for _, def in ipairs(definition) do
--            local command =
--                table.concat(vim.tbl_flatten({ 'autocmd', def }), ' ')
--            vim.api.nvim_command(command)
--        end
--        vim.api.nvim_command('augroup END')
--    end
--end

-- Set autosave
--table.insert(autocmds['doom_core'], {
--    'TextChanged,TextChangedI',
--    '<buffer>',
--    'silent! write',
--})
