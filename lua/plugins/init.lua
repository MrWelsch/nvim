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

return require("packer").startup(function(use)
    use {
	    "wbthomason/packer.nvim",
        opt = true
    }
    use {
        "charlief0x/vim-dracula-pro",
        opt = true
    }
    use {
	    "kyazdani42/nvim-web-devicons",
	    module = "nvim-web-devicons"
    }
    -- TREESITTER
    use {
	    "nvim-treesitter/nvim-treesitter",
	    run = "TSUpdate",
        after = "vim-dracula-pro"
    }
    use {
	    "windwp/nvim-ts-autotag", 
	    after = "vim-dracula-pro",
    }
    use {
	    "andymass/vim-matchup", 
	    after = "vim-dracula-pro",
    }
    use {
        "windwp/nvim-autopairs", 
	    after = "vim-dracula-pro",
    }
    -- LINTER
    use {
	    "neovim/nvim-lspconfig", 
        after = "vim-dracula-pro"
    }
    use {
	    "glepnir/lspsaga.nvim", 
	    after = "vim-dracula-pro"
    }
    use {
	    "kabouzeid/nvim-lspinstall", 
	    after = "vim-dracula-pro"
    }

    -- ERRORS
    use {
	    "folke/trouble.nvim", 
	    after = "vim-dracula-pro"
    }

    -- TELESCOPE

    use {
	    "nvim-telescope/telescope.nvim", 
	    cmd = "Telescope",
	    module = "telescope",
	    requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" }

    }
    use {
	    "nvim-telescope/telescope-fzy-native.nvim", 
	    after = "vim-dracula-pro"
    }
    use {
	    "nvim-telescope/telescope-project.nvim", 
	    after = "vim-dracula-pro"
    }

    -- DEBUGGING
    use {
	    "mfussenegger/nvim-dap", 
	    after = "vim-dracula-pro"
    }

    -- AUTOCOMPLETE
    use {
	    "hrsh7th/nvim-compe", 
	    after = "vim-dracula-pro"
    }

    -- EXPLORER
    --use {"kyazdani42/nvim-tree.lua", after = "vim-dracula-pro"}
    use {
	    "tamago324/lir.nvim", 
	    requires = "nvim-web-devicons",
        after = "vim-dracula-pro"
    }
    -- This puts nvim-tree in curdir
    use {
	    "ahmedkhalf/lsp-rooter.nvim", 
	    after = "vim-dracula-pro"
    }

    -- TERMINAL
    use {
	    "akinsho/nvim-toggleterm.lua",
        after = "vim-dracula-pro"
    }

    -- GIT
    use {
	    "lewis6991/gitsigns.nvim", 
	    requires = "nvim-lua/plenary.nvim",
        after = "vim-dracula-pro"
    }
    use {
	    "f-person/git-blame.nvim", 
	    after = "vim-dracula-pro"
    }

    -- UNDOTREE
    use {
	    "mbbill/undotree", 
	    after = "vim-dracula-pro"
    }

    -- KEYBINDS
    use {
	    "folke/which-key.nvim", 
        event = "BufEnter",
    }

    -- MISCELLANIOUS
    use {
	    "glepnir/dashboard-nvim", 
    }
    use {
	    "kevinhwang91/nvim-bqf", 
	    after = "vim-dracula-pro"
    }
    use {
	    "norcalli/nvim-colorizer.lua", 
    }

    -- LATEX
    use {
	    "lervag/vimtex", 
	    after = "vim-dracula-pro"
    }

    -- COMMENTING
    use {
	    "terrortylor/nvim-comment", 
	    after = "vim-dracula-pro"
    }
    use {
	    "JoosepAlviste/nvim-ts-context-commentstring", 
	    after = "vim-dracula-pro"
    }

    -- STATUS & BUFFERLINE
    use {
	    "glepnir/galaxyline.nvim", 
	    after = "vim-dracula-pro"
    }
    use {
	    "romgrk/barbar.nvim", 
	    after = "vim-dracula-pro"
    }

    -- LIVE SERVER
    use {
	    "turbio/bracey.vim", 
	    run = "npm install --prefix server", 
	    after = "vim-dracula-pro"
    }

end)
