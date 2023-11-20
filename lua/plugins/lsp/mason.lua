-- MASON
return {
    'jay-babu/mason-null-ls.nvim', 
    event = { 'BufReadPre', 'BufNewFile' }, 
    dependencies = {
        'williamboman/mason.nvim', 
        'jose-elias-alvarez/null-ls.nvim'
    },
    config = function()
        local mason_status_ok, mason = pcall(require, "mason")
        if not mason_status_ok then
            return
        end

        local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
        if not mason_lspconfig_status_ok then
            return
        end

        local status_ok, null_ls = pcall(require, "null-ls")
        if not status_ok then
            return
        end

        local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
        if not mason_null_ls_status_ok then
            return
        end

--         local mason_dap_status_ok, mason_dap = pcall(require, "mason-nvim-dap")
--         if not mason_dap_status_ok then
--             return
--         end

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

        null_ls.setup {
            sources = {
                -- Anything not supported by mason.
            },
        
            -- AUTO FORMATTING ON SAVE
            -- (manually keybinded in 'whichkey')
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            -- vim.lsp.buf.formatting_sync()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        }

        mason_null_ls.setup({
            ensure_installed = {
                -- Opt to list sources here, when available in mason.
                'stylua', 
                'jq', 
                'prettierd'
            },
            handlers = {
                -- Providing an empty handlers will cause all sources to be automatically registered in null-ls. 
                -- See below example on how to disable.
                
                -- function() end, -- disables automatic setup of all null-ls sources
                -- stylua = function(source_name, methods)
                --   null_ls.register(null_ls.builtins.formatting.stylua)
                -- end,
                -- shfmt = function(source_name, methods)
                --   -- custom logic
                --   require('mason-null-ls').default_setup(source_name, methods) -- to maintain default behavior
                -- end,
            },
        })

--         mason_dap.setup({
--             --> COMMANDS
--             -- :DapInstall [<adapter>...] - installs the provided adapter
--             -- :DapUninstall <adapter> ... - uninstalls the provided adapter
--
--             --> CONFIG
--             -- A list of adapters to install if they're not already installed.
--             -- This setting has no relation with the `automatic_installation` setting.
--             ensure_installed = {'stylua', 'jq'},
--
--             -- NOTE: this is left here for future porting in case needed
--             -- Whether adapters that are set up (via dap) should be automatically installed if they're not already installed.
--             -- This setting has no relation with the `ensure_installed` setting.
--             -- Can either be:
--             --   - false: Daps are not automatically installed.
--             --   - true: All adapters set up via dap are automatically installed.
--             --   - { exclude: string[] }: All adapters set up via mason-nvim-dap, except the ones provided in the list, are automatically installed.
--             --       Example: automatic_installation = { exclude = { "python", "delve" } }
--             automatic_installation = true,
--
--             -- Sets up dap in the predefined manner
--             handlers = {
--                 function(config)
--                     -- all sources with no handler get passed here
--
--                     -- Keep original functionality
--                     require('mason-nvim-dap').default_setup(config)
--                 end,
--             },
--         })
    end
}