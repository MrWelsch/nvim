-- TODO: Check out formatter

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

execute "packadd packer.nvim"

-- Auto compile if there are changes in plugins.lua
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

require("packer").startup(function(use)
    use {
	    "wbthomason/packer.nvim",
        opt = true
    }
    use {
        "charlief0x/vim-dracula-pro",
        config = function() require('colors') end,
        event = "BufEnter",
    }
    use {
	    "kyazdani42/nvim-web-devicons",
	    module = "nvim-web-devicons"
    }
    -- TREESITTER
    use {
	    "nvim-treesitter/nvim-treesitter",
	    config = function() require('plugins.config.treesitter') end,
	    run = "TSUpdate",
        event = "BufEnter",
        module = "nvim-treesitter"
    }
    use {
	    "windwp/nvim-ts-autotag",
	    after = "nvim-treesitter",
    }
    use {
	    "andymass/vim-matchup",
	    config = function() require('plugins.config.matchup') end,
	    after = "nvim-treesitter",
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require('plugins.config.autopairs') end,
        event = "InsertEnter"
    }
    -- LINTER
    use {
	    "neovim/nvim-lspconfig",
	    config = function()
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
	    end,
        event = "BufEnter"
    }
    use {
	    "glepnir/lspsaga.nvim",
	    after = "nvim-lspconfig"
    }
    use {
	    "kabouzeid/nvim-lspinstall",
	    config = function() require('plugins.config.lspinstall') end,
	    after = "nvim-lspconfig"
    }

    use {
	    "folke/trouble.nvim",
        module = "trouble"
    }

    -- TELESCOPE

    use {
	    "nvim-telescope/telescope.nvim",
	    config = function() require('plugins.config.telescope') end,
	    cmd = "Telescope",
	    module = "telescope",
	    requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" }

    }
    use {
	    "nvim-telescope/telescope-fzy-native.nvim",
	    after = "telescope.nvim"
    }
    use {
	    "nvim-telescope/telescope-project.nvim",
	    after = "telescope.nvim"
    }

    -- DEBUGGING
    use {
	    "mfussenegger/nvim-dap",
	    config = function() require('plugins.config.nvim-dap') end,
	    event = "ColorScheme"
    }

    -- AUTOCOMPLETE
    use {
	    "hrsh7th/nvim-compe",
	    config = function() require('plugins.config.compe') end,
        after = "nvim-lspconfig"
    }

    -- EXPLORER
    --use {"kyazdani42/nvim-tree.lua", after = "vim-dracula-pro"}
    use {
	    "tamago324/lir.nvim",
	    config = function() require('plugins.config.lvr') end,
	    requires = "nvim-web-devicons",
        event = "ColorScheme"
    }
    -- This puts nvim-tree in curdir
    use {
	    "ahmedkhalf/lsp-rooter.nvim",
	    config = function() require('plugins.config.lsp-rooter') end,
        event = "ColorScheme"
    }

    -- TERMINAL
    use {
	    "akinsho/nvim-toggleterm.lua",
	    config = function() require('plugins.config.toggleterm') end,
        event = "ColorScheme"
    }

    -- GIT
    use {
	    "lewis6991/gitsigns.nvim",
	    config = function() require('plugins.config.gitsigns') end,
	    requires = "nvim-lua/plenary.nvim",
        event = "ColorScheme"
    }
    use {
	    "f-person/git-blame.nvim",
	    config = function() require('plugins.config.gitblame') end,
	    event = "ColorScheme"
    }

    -- UNDOTREE
    use {
	    "mbbill/undotree",
	    event = "ColorScheme"
    }

    -- KEYBINDS
    use {
	    "folke/which-key.nvim",
	    config = function() require('plugins.config.which-key') end,
        event = "BufEnter",
    }

    -- MISCELLANIOUS
    use {
	    "glepnir/dashboard-nvim",
	    config = function() require('plugins.config.dashboard') end,
    }
    use {
	    "kevinhwang91/nvim-bqf",
	    event = "ColorScheme"
    }
    use {
	    "norcalli/nvim-colorizer.lua",
	    config = function() require('plugins.config.colorizer') end,
    }

    -- LATEX
    use {
	    "lervag/vimtex",
	    config = function() require('plugins.config.vimtex') end,
	    event = "ColorScheme"
    }

    -- COMMENTING
    use {
	    "terrortylor/nvim-comment",
	    config = function() require('plugins.config.comment') end,
	    event = "ColorScheme"
    }
    use {
	    "JoosepAlviste/nvim-ts-context-commentstring",
	    after = "nvim-treesitter"
    }

    -- STATUS & BUFFERLINE
    use {
	    "glepnir/galaxyline.nvim",
	    config = function() require('plugins.config.galaxyline') end,
	    event = "BufEnter"
    }
    use {
	    "romgrk/barbar.nvim",
	    config = function() require('plugins.config.barbar') end,
	    event = "BufEnter"
    }

    -- LIVE SERVER
    use {
	    "turbio/bracey.vim",
	    run = "npm install --prefix server",
	    event = "ColorScheme"
    }
end)
