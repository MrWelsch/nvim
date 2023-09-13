return{
    --> IMPORT SUBFOLDERS AS MODULES
    {import = 'plugins.colorschemes'},
    {import = 'plugins.lsp'},
    {import = 'plugins.ui'},

    --> Compiler & Task Runner
    -- TODO: Refactor this into separate files compiler.lua & overseer.lua
    {
        "Zeioth/compiler.nvim",
        cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
        dependencies = { "stevearc/overseer.nvim" },
        opts = {},
    },
    {
        "stevearc/overseer.nvim",
        commit = "19aac0426710c8fc0510e54b7a6466a03a1a7377",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 10,
                max_height = 10,
                default_detail = 1,
                bindings = { ["q"] = function() vim.cmd("OverseerClose") end },
            },
            -- Configure the floating window used for task templates that require input
            -- and the floating window used for editing tasks
            form = {
                border = require("general.misc").border,
            },
            -- Configure the floating window used for confirmation prompts
            confirm = {
                border = require("general.misc").border,
            },
            -- Configuration for task floating windows
            task_win = {
                border = require("general.misc").border,
            },
        },
    },

    --> LSP
    'williamboman/mason-lspconfig.nvim',
    
    --> DEBUGGING
    'jay-babu/mason-nvim-dap.nvim',
    
    --> EDITOR
    {'windwp/nvim-ts-autotag', ft = 'html' },

    --> GENERAL
    { 'ellisonleao/glow.nvim', ft = 'markdown', config = true, cmd = 'Glow' },
}