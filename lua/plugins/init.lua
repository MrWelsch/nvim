local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- return packer.startup(function(use)
return require('packer').startup(function()
    use {
	    "wbthomason/packer.nvim",
    }
    -- DRACULA PRO
    -- use {
    --     "charlief0x/vim-dracula-pro",
    --     config = function() require('colors') end,
    --     event = "BufEnter",
    -- }
    -- GRUVBOX FLAT
    -- 	use {
    --        "eddyekofo94/gruvbox-flat.nvim",
    --        config = function() require('colors') end,
    --        event = "BufEnter",
    --    }
    --    MONOKAI PRO
    use {
        "https://gitlab.com/__tpb/monokai-pro.nvim",
        config = function() require('colors') end,
        event = "BufEnter",
        -- Do not update, cause modified under:
        -- /Users/nico/.local/share/nvim/site/pack/packer/opt/monokai-pro.nvim
        lock = true,
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
        -- VIMSCRIPT
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
        event = "BufEnter"
    }
    use {
	    "williamboman/nvim-lsp-installer",
	    config = function() require('lsp.lsp-installer') end,
	    after = "nvim-lspconfig"
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function() require('lsp.null-ls') end,
        requires = "nvim-lua/plenary.nvim",
        after = "nvim-lspconfig"
    }
    -- use {
    --     -- DO I NEED THIS?
	--     "folke/trouble.nvim",
    --     module = "trouble"
    -- }

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
	    config = function() require('telescope').load_extension('project') end,
	    after = "telescope.nvim"
    }

    -- AUTOCOMPLETE
    use {
	    "hrsh7th/nvim-cmp",
	    config = function() require('plugins.config.cmp') end,
        -- after = "nvim-lspconfig"
    }
    use {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        after = "nvim-cmp"
    }

    -- SNIPPETS
    use {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        "rafamadriz/friendly-snippets",
        -- config = function() require('plugins.config.luasnip') end,
    }

	-- FORMAT
	use {
        -- VIMSCRIPT 3.5%
		"lukas-reineke/format.nvim",
		config = function() require('plugins.config.format') end,
		cmd = { "Format", "FormatWrite" },
	}
	
    -- EXPLORER
    use {
		"kyazdani42/nvim-tree.lua",
		requires = "nvim-web-devicons",
		config = function() require('plugins.config.nvim-tree') end,
		cmd = { "NvimTreeClipboard", "NvimTreeClose", "NvimTreeFindFile", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeToggle" },
	}

    -- PROJECT MANAGEMENT
    use {
        -- NOT YET WORKING!
        "ahmedkhalf/project.nvim",
        config = function() require('plugins.config.project') end,
        event = "ColorScheme"
    }

    -- TERMINAL
    use {
        -- VIMSCRIPT 1.4%
	    "akinsho/nvim-toggleterm.lua",
	    config = function() require('plugins.config.toggleterm') end,
        event = "BufEnter"
    }

    -- GIT
    use {
	    "lewis6991/gitsigns.nvim",
	    config = function() require('plugins.config.gitsigns') end,
	    requires = "nvim-lua/plenary.nvim",
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
        'goolord/alpha-nvim',
        config = function() require('plugins.config.alpha') end,
    }
    use {
        -- DO I NEED THIS?
	    "kevinhwang91/nvim-bqf",
	    event = "ColorScheme"
    }
    use {
        -- VIMSCRIPT 1.4%
        -- MAYBE LOOK FOR ALTERNATIVE
	    "norcalli/nvim-colorizer.lua",
	    config = function() require('plugins.config.colorizer') end,
    }

    -- LATEX
    use {
	    'aspeddro/tex.nvim',
	    config = function() require('plugins.config.tex') end,
	    event = "BufEnter"
    }

    -- MARKDOWN
    use {
        -- MAYBE SWITCH TO:
        -- https://github.com/ellisonleao/glow.nvim
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        run = "cd app && yarn install"
    }

    -- COMMENTING
    use {
	    "b3nj5m1n/kommentary",
	    config = function() require('plugins.config.kommentary') end,
	    event = "BufEnter"
    }
    use {
	    "JoosepAlviste/nvim-ts-context-commentstring",
	    after = "nvim-treesitter"
    }

    -- STATUS & BUFFERLINE
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require('plugins.config.lualine') end,
        event = "BufEnter"
    }
	use {
		"akinsho/nvim-bufferline.lua",
		config = function() require('plugins.config.bufferline') end,
		event = "BufEnter",
	}
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
