return{
    --> IMPORT SUBFOLDERS AS MODULES
    {import = 'plugins.colorschemes'},
    {import = 'plugins.debug'},
    {import = 'plugins.lsp'},
    {import = 'plugins.ui'},

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