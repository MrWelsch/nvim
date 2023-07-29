local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- SET UP SERVERS THAT SHOULD AUTOMATICALLY INSTALLED
local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    -- rust_analyzer = {},
    -- tsserver = {},
    html = { filetypes = { 'html', 'twig', 'hbs'} },
  
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  }

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason.setup()

mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers)
})

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
    end
}