-- MASON
return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"nvimtools/none-ls.nvim",
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
			terraformls = {
				filetypes = { "terraform", "tf", "hcl" },
			},
			tflint = {
				filetypes = { "terraform", "tf", "hcl" },
			},
			ansiblels = {},
			bashls = {},
			dockerls = {},
			docker_compose_language_service = {},
			-- gopls = {},
			helm_ls = {},
			jsonls = {},
			marksman = {},
			pyright = {},
			taplo = {}, --toml
			yamlls = {},
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		}

		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		mason_lspconfig.setup_handlers({
			function(yamlls)
				require("lspconfig").yamlls.setup({
					settings = {
						yaml = {
							schemas = {
								kubernetes = "*.yml",
								["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
								["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
								["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
								["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
								["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
								["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
								["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
								["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
								["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
								["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
								["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
								["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
							},
						},
					},
				})
			end,
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				})
			end,
		})

		null_ls.setup({
			sources = {
				-- Anything not supported by mason.
				null_ls.builtins.formatting.terraform_fmt,
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
		})

		mason_null_ls.setup({
			ensure_installed = {
				-- Opt to list sources here, when available in mason.
				"stylua",
				"jq",
				"prettierd",
				"gofumpt",
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
	end,
}
