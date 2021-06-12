--vim.cmd [[
--	syntax off
--	filetype off
--	filetype plugin indent off
--]]

--vim.opt.shadafile = "NONE"
--vim.g.loaded_gzip = false
--vim.g.loaded_matchit = false
--vim.g.loaded_netrwPlugin = false
--vim.g.loaded_tarPlugin = false
--vim.g.loaded_zipPlugin = false
--vim.g.loaded_man = false
--vim.g.loaded_2html_plugin = false
--vim.g.loaded_remote_plugins = false

CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

--vim.defer_fn(vim.schedule_wrap(function()
	require('options')
	require('keybinds')
	require('plugins')

	-- OUTSOURCED PLUGIN CONFIGS
	--require('lv-nvimtree') -- This plugin must be required somewhere before colorscheme.  Placing it after will break navigation keymappings
	require('lv-lir') -- Alternate Explorer
	require('colorscheme') -- This plugin must be required somewhere after nvimtree. Placing it before will break navigation keymappings
	require('lv-galaxyline')
	require('lv-comment')
	require('lv-gitblame')
	require('lv-compe')
	require('lv-barbar')
	require('lv-dashboard')
	require('lv-telescope')
	require('lv-gitsigns')
	require('lv-treesitter')
	require('lv-matchup')
	require('lv-autopairs')
	require('lv-rnvimr')
	require('lv-which-key')
	require('lv-lsp-rooter')
	require('lv-toggleterm')
	require('lv-colorizer')
	require('lv-gitblame')

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

--	vim.opt.shadafile = ""
--	vim.cmd [[
--		rshada!
--		doautocmd BufRead
--		syntax on
--		filetype on
--		filetype plugin indent on
--		PackerLoad nvim-treesitter
--	]]
--end), 0)