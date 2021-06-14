require'lspconfig'.clangd.setup {
    cmd = {DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd"},
    on_attach = require'lsp'.common_on_attach,
    filetypes = {"c", "cpp", "objc", "objcpp"},
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            signs = false,
            underline = false,
            update_in_insert = true

        })
    }
}
