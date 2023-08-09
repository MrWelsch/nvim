return{
     --> THEMES
    -- { 'catppuccin/nvim', lazy = true },
    -- { 'folke/tokyonight.nvim', lazy = true },
    -- { 'tiagovla/tokyodark.nvim', lazy = true },
    -- { 'shaunsingh/nord.nvim', lazy = true },
    -- { 'charlief0x/vim-dracula-pro', lazy = true },
    { 'eddyekofo94/gruvbox-flat.nvim', lazy = true },
    -- { 'neanias/everforest-nvim', lazy = true },
    -- { 'rose-pine/neovim', lazy = true },
    -- { 'https://gitlab.com/__tpb/monokai-pro.nvim', lazy = true },
    
    -- LSP
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp', -- required by 'neovim/nvim-lspconfig' -> don't set as a dependency of 'hrsh7th/nvim-cmp'
    
    --> DEBUGGING
    'jay-babu/mason-nvim-dap.nvim',
    
    --> EDITOR
    {'windwp/nvim-ts-autotag', ft = 'html' },

    --> GENERAL
    { 'ellisonleao/glow.nvim', ft = 'markdown', config = true, cmd = 'Glow' },
}