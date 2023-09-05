return{
    --> IMPORT SUBFOLDERS AS MODULES
    {import = 'plugins.colorschemes'},
    {import = 'plugins.lsp'},
    {import = 'plugins.ui'},

    -- LSP
    'williamboman/mason-lspconfig.nvim',
    
    --> DEBUGGING
    'jay-babu/mason-nvim-dap.nvim',
    
    --> EDITOR
    {'windwp/nvim-ts-autotag', ft = 'html' },

    --> GENERAL
    { 'ellisonleao/glow.nvim', ft = 'markdown', config = true, cmd = 'Glow' },
}