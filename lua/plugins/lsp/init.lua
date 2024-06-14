return {
    'neovim/nvim-lspconfig',
    dependencies = {'hrsh7th/cmp-nvim-lsp'},
    event = 'BufAdd',
    config = function(plugin)
        --> LSP OPTIONS
        local config = {
            virtual_text = true, -- toggle virtual text
            signs = {
                active = signs, -- show signs
            },
            update_in_insert = true,
            underline = true,
            severity_sort = true, -- e.g. ERROR over WARN
            float = {
                focusable = false,
                style = "minimal",
                border = require"general.misc".border,
                source = "always",
                header = "",
                prefix = "",
            },
        }

        vim.diagnostic.config(config)

        --> DIAGNOSTIC GUTTER SIGNS
        local signs = {
            Error = require"general.misc".error,
            Warn = require"general.misc".warn,
            Hint = require"general.misc".hint,
            Info = require"general.misc".info
        }

        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
        end

        --> BORDERS ON DIAGNOSTIC WINDOWS (e.g. Hover)
        -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        --     border = require"general.misc".border, 
        -- })

        -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        --     border = require"general.misc".border,
        -- })
        -- ':LspInfo' BORDER
        local lsp_info = require('lspconfig.ui.windows').default_options
        lsp_info.border = require"general.misc".border
    end
}