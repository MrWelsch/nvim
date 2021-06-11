-- npm install -g vscode-json-languageserver
require'lspconfig'.jsonls.setup {
    cmd = {
        "node", DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
        "--stdio"
    },
    on_attach = require'lsp'.common_on_attach,

    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
        }
    },
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {spacing = 0, prefix = ""},
            signs = true,
            underline = true
        })
    }
}
