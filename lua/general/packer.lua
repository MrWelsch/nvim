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
    autocmd BufWritePost packer.lua source <afile> | PackerSync
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

    use {"wbthomason/packer.nvim"}

    -- DRACULA PRO
    -- use {"charlief0x/vim-dracula-pro", config = [[require('colors')]], event = "BufEnter"}

    -- GRUVBOX FLAT
    -- 	use {"eddyekofo94/gruvbox-flat.nvim", config = [[require('colors')]], event = "BufEnter"}

    -- MONOKAI PRO
    use {"https://gitlab.com/__tpb/monokai-pro.nvim", config = [[require('ui.colors')]], event = "BufEnter"}
    use {"kyazdani42/nvim-web-devicons", module = "nvim-web-devicons"}
	
    -- TREESITTER
    use {"nvim-treesitter/nvim-treesitter", config = [[require('plugins.treesitter')]], run = "TSUpdate", event = "BufRead", module = "nvim-treesitter"}
    use {"windwp/nvim-ts-autotag", after = "nvim-treesitter"}
    -- VIMSCRIPT
    use {"andymass/vim-matchup", config = [[require('plugins.matchup')]], after = "nvim-treesitter",}
    use {"windwp/nvim-autopairs", config = [[require('plugins.autopairs')]], event = "InsertEnter"}

    -- LINTER
    use {"neovim/nvim-lspconfig", event = "BufEnter"}
    use {"williamboman/nvim-lsp-installer", config = [[require('lsp.lsp-installer')]], after = "nvim-lspconfig"}
    use {"jose-elias-alvarez/null-ls.nvim", config = [[require('lsp.null-ls')]], requires = "nvim-lua/plenary.nvim", after = "nvim-lspconfig"}

    -- TELESCOPE
    use {"nvim-telescope/telescope.nvim", config = [[require('plugins.telescope')]], cmd = "Telescope", module = "telescope", requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim"}}
    use {"nvim-telescope/telescope-project.nvim", config = [[require('telescope').load_extension('project')]], after = "telescope.nvim"}

    -- SNIPPETS & AUTOCOMPLETE
    use {'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', "rafamadriz/friendly-snippets"}
    use {"hrsh7th/nvim-cmp", config = [[require('plugins.cmp')]], after = 'LuaSnip'}
    use {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", after = "nvim-cmp"}
    
	-- FORMAT (VIMSCRIPT 3.5%)
	use {"lukas-reineke/format.nvim", config = [[require('plugins.format')]], cmd = { "Format", "FormatWrite" }}
    
    -- PROJECT MANAGEMENT (NOT YET WORKING!)
    use {"ahmedkhalf/project.nvim", config = [[require('plugins.project')]], event = "ColorScheme"}

    -- TERMINAL (VIMSCRIPT 1.4%)
    use {"akinsho/nvim-toggleterm.lua", config = [[require('plugins.toggleterm')]], event = "BufEnter"}

    -- GIT
    use {"lewis6991/gitsigns.nvim", config = [[require('plugins.gitsigns')]], requires = "nvim-lua/plenary.nvim", event = "BufRead"}

    -- KEYBINDS
    use {"folke/which-key.nvim", config = [[require('plugins.which-key')]], event = "BufEnter"}

    -- MISCELLANIOUS
    use {'goolord/alpha-nvim', config = [[require('plugins.alpha')]]}
    -- DO I NEED THIS?
    use {"kevinhwang91/nvim-bqf", event = "ColorScheme"}
    -- VIMSCRIPT 1.4%
    -- MAYBE LOOK FOR ALTERNATIVE
    use {"norcalli/nvim-colorizer.lua", config = [[require('plugins.colorizer')]], event = 'BufReadPre'}

    -- LATEX
    use {'aspeddro/tex.nvim', config = [[require('plugins.tex')]], event = "BufEnter"}

    -- MARKDOWN (MAYBE SWITCH TO: https://github.com/ellisonleao/glow.nvim)
    use {"iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install"}

    -- COMMENTING
    use {"b3nj5m1n/kommentary", config = [[require('plugins.kommentary')]], event = "BufEnter"}
    use {"JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter"}

    -- SIDEBAR, STATUS & BUFFERLINE
    use {"kyazdani42/nvim-tree.lua", requires = "nvim-web-devicons", config = [[require('ui.nvim-tree')]], cmd = {"NvimTreeToggle"}}
    use {'tamton-aquib/staline.nvim', config = [[require('ui.staline')]], event = "BufEnter"}
	use {"akinsho/nvim-bufferline.lua", config = [[require('ui.bufferline')]], event = "BufEnter"}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
