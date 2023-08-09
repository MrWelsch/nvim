--> MEASURE START TIME
vim.g.start_time = vim.fn.reltime()

--> REQUIREMENTS
require('general.options')
require('general.mappings')

-- require('load_plugins')

--> PLUGIN MANAGER
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local opts = {
    defaults = {
        lazy = true, -- should plugins be lazy-loaded?
    },
    ui = {
        border = require'general.misc'.border,
    },
}

require('lazy').setup('plugins', opts)

require('plugins.ui')
require('plugins.lsp')
require('plugins.dap')

--> SET COLORSCHEME
-- require('plugins.colorschemes.init').gruvbox(false)
vim.cmd("colorscheme "..('gruvbox-flat'))