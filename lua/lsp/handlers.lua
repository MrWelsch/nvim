local M = {}

--> LSP BASE CONFIG
M.setup = function()
    -- DIAGNOSTIC SIGNS
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    -- SIGNING
    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end
    
    -- OPTIONS
    local config = {
        virtual_text = false, -- toggle virtual text
        signs = {
            active = signs, -- show signs
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = require"general.misc".border,
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config) -- apply options

    -- HANDLERS
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "double",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "double",
    })
end

--> MATCHES UP IDENTICAL STRINGS (REPLACES NVIM-MATCHUP)
local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
    -- if client.server_capabilities.hoverProvider then
        vim.api.nvim_exec(
            [[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]],
            false
        )
    end
end

--> ATTACH FORMATTING AND MATCHING
M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        -- client.resolved_capabilities.document_formatting = false
        client.server_capabilities.documentFormattingProvider = false
    end
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
    lsp_highlight_document(client)
end

--> CAPABILITIES
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Protected call for cmp_nvim_lsp
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

-- Apply capabilities
-- M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M