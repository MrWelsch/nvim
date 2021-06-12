vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false

CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

-- Start LSP when necessary and also initialize the dashboard configuration
vim.cmd [[ autocmd InsertEnter * ++once silent! LspStart ]]
require('plugins.config.dashboard')

vim.defer_fn(vim.schedule_wrap(function()
	require('options')
	require('keybinds')
	require('plugins')
        vim.cmd [[
            PackerLoad vim-dracula-pro
        ]]
		require('plugins.config.autopairs')
		require('plugins.config.barbar')
		require('plugins.config.colorizer')
		require('plugins.config.comment')
		require('plugins.config.compe')
		require('plugins.config.galaxyline')
		require('plugins.config.dashboard')
		require('plugins.config.gitblame')
		require('plugins.config.gitsigns')
		require('plugins.config.lsp-rooter')
		require('plugins.config.lspinstall')
		require('plugins.config.lvr')
		require('plugins.config.matchup')
		require('plugins.config.nvim-dap')
		--require('plugins.config.nvim-tree')
		require('plugins.config.telescope')
		require('plugins.config.toggleterm')
		require('plugins.config.treesitter')
		require('plugins.config.vimtex')
		require('plugins.config.which-key')
	require('colors')

	-- LSP
	require('lsp')
	require('lsp.bash-ls')
	require('lsp.css-ls')
	require('lsp.docker-ls')
	require('lsp.efm-general-ls')
	require('lsp.html-ls')
	require('lsp.json-ls')
	require('lsp.js-ts-ls')
	require('lsp.latex-ls')
	require('lsp.lua-ls')
	require('lsp.python-ls')
	require('lsp.vim-ls')
	require('lsp.yaml-ls')

end), 0)
