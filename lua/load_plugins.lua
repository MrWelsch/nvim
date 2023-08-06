local fn = vim.fn

--> BOOTSTRAP
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

--> PLUGINS
local plugins = {
    --> UI, ICONS
    { 'echasnovski/mini.starter', version = '*' },
    { 'kyazdani42/nvim-tree.lua', dependencies = 'nvim-web-devicons', cmd = {'NvimTreeToggle'} }, --TODO: DO I NEED THIS?
    'kyazdani42/nvim-web-devicons',
    'tamton-aquib/staline.nvim',
	'akinsho/nvim-bufferline.lua',  --TODO: DO I NEED THIS? MB CHANGE TO HARPOON.

     --> THEMES
    { 'catppuccin/nvim', lazy = true },
    { 'folke/tokyonight.nvim', lazy = true },
    { 'tiagovla/tokyodark.nvim', lazy = true },
    { 'shaunsingh/nord.nvim', lazy = true },
    { 'charlief0x/vim-dracula-pro', lazy = true },
    { 'eddyekofo94/gruvbox-flat.nvim', lazy = true },
    { 'neanias/everforest-nvim', lazy = true },
    { 'rose-pine/neovim', lazy = true },
    { 'https://gitlab.com/__tpb/monokai-pro.nvim', lazy = true },
    
    --> SYNTAX HIGHLIGHTING
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'wiliamks/nice-reference.nvim', --TODO: DO I NEED THIS?
    
    --> LINTER, COMPLETION & SNIPPETS
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp', -- required by 'neovim/nvim-lspconfig' -> don't set as a dependency of 'hrsh7th/nvim-cmp'
    { 'hrsh7th/nvim-cmp', dependencies = { 
        'hrsh7th/cmp-buffer', 
        'hrsh7th/cmp-path', 
        'hrsh7th/cmp-cmdline',
        { 'L3MON4D3/LuaSnip', dependencies = {
            'rafamadriz/friendly-snippets',
            }
        },
        'saadparwaiz1/cmp_luasnip', 
        },
    },

    --> TELESCOPE
    { 'nvim-telescope/telescope.nvim', cmd = 'Telescope', dependencies = { 'nvim-lua/plenary.nvim' } },
    'ahmedkhalf/project.nvim',      --TODO: DO I NEED THIS?
    
    --> DEBUGGING
    { 'mfussenegger/nvim-dap', dependencies = {'Pocco81/DAPInstall.nvim'} },

    --> EDITOR
    'windwp/nvim-autopairs',        --TODO: DO I NEED THIS?
    'windwp/nvim-ts-autotag',       --TODO: DO I NEED THIS?
    'norcalli/nvim-colorizer.lua',  --TODO: DO I NEED THIS?
    'numToStr/Comment.nvim',

    --> GIT
    { 'lewis6991/gitsigns.nvim', dependencies = 'nvim-lua/plenary.nvim' },

    --> GENERAL
    'akinsho/nvim-toggleterm.lua',   --TODO: DO I NEED THIS?
    'folke/which-key.nvim',
    'aspeddro/tex.nvim',
    { 'ellisonleao/glow.nvim', ft = 'markdown' },    --TODO: DO I NEED THIS? ALTERNATIVE MARKDOWN VIEWER?
}

--> CONFIG
local opts = {
    defaults = {
        lazy = true, -- should plugins be lazy-loaded?
    },
    ui = {
        border = require"general.misc".border,
    },
}

--> Add this at the end of the file
require('lazy').setup(plugins, opts)

--> PLUGIN CONFIG
local need_bootstrap = not vim.loop.fs_stat(lazypath)

if not need_bootstrap then
    require 'load_configs'
end