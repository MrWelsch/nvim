local fn = vim.fn

--> Automatically install packer
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

-- Autocommand that reloads neovim whenever you save the packer.lua file
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
        return require("packer.util").float()
    end,
    },
}

--> PLUGINS

return require('packer').startup(function()

    use {"wbthomason/packer.nvim"}

    --> UI, THEMES, ICONS & SYNTAX HIGHLIGHTING
    use {'echasnovski/mini.starter', branch = 'stable', config = [[require('ui.starter')]]}
    use {"kyazdani42/nvim-tree.lua", requires = "nvim-web-devicons", config = [[require('ui.nvim-tree')]], cmd = {"NvimTreeToggle"}} --TODO: DO I NEED THIS?
    use {"kyazdani42/nvim-web-devicons", module = "nvim-web-devicons"} --TODO: DO I NEED THIS?
    use {'tamton-aquib/staline.nvim', config = [[require('ui.staline')]], event = "BufEnter"}
	use {"akinsho/nvim-bufferline.lua", config = [[require('ui.bufferline')]], event = "BufEnter"} --TODO: DO I NEED THIS?
    use { -- PUT THEMES HERE
        'catppuccin/nvim',
        'folke/tokyonight.nvim',
        'tiagovla/tokyodark.nvim',
        'shaunsingh/nord.nvim',
        "charlief0x/vim-dracula-pro",
        "eddyekofo94/gruvbox-flat.nvim",
        "https://gitlab.com/__tpb/monokai-pro.nvim",
        event = 'BufEnter'
    }
    use {"nvim-treesitter/nvim-treesitter", config = [[require('plugins.treesitter')]], run = "TSUpdate", event = "BufRead", module = "nvim-treesitter"}
    use {'wiliamks/nice-reference.nvim', config = [[require('plugins.references')]], before = "nvim-lspconfig"} --TODO: DO I NEED THIS?
    
    --> LINTER, COMPLETION & SNIPPETS
    use {'williamboman/mason.nvim', config = [[require('lsp.mason-lsp-config')]], event = 'BufEnter'}
    use {'williamboman/mason-lspconfig.nvim', config = [[require('lsp.mason-lsp-config')]], after = 'mason.nvim'}
    use {'folke/neodev.nvim', config = [[require('lsp.neodev')]], after = 'mason-lspconfig.nvim'}
    use {"neovim/nvim-lspconfig", after = 'neodev.nvim'}--TODO: REFACTOR THOSE 4 (DEPENDENCIES)
    
    use {'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', "rafamadriz/friendly-snippets"}
    use {"hrsh7th/nvim-cmp", config = [[require('plugins.cmp')]], after = 'LuaSnip'}
    use {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", after = "nvim-cmp"}

    --> TELESCOPE
    use {"nvim-telescope/telescope.nvim", config = [[require('plugins.telescope')]], cmd = "Telescope", module = "telescope", requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim"}}
    use {"ahmedkhalf/project.nvim", config = [[require('plugins.project')]]} --TODO: DO I NEED THIS?
    
    --> DEBUGGING
    use {"mfussenegger/nvim-dap", event = "BufEnter"}
    use {"Pocco81/DAPInstall.nvim", config = [[require('plugins.dap')]], after = "nvim-dap"}

    --> EDITOR
    use {"windwp/nvim-autopairs", config = [[require('plugins.autopairs')]], event = "InsertEnter"} --TODO: DO I NEED THIS?
    use {"windwp/nvim-ts-autotag", after = "nvim-treesitter"} --TODO: DO I NEED THIS?
    use {"norcalli/nvim-colorizer.lua", config = [[require('plugins.colorizer')]], event = 'BufReadPre'} --TODO: DO I NEED THIS?
    use {"numToStr/Comment.nvim", config = [[require('plugins.comments')]], event = "BufEnter"}

    --> GIT
    use {"lewis6991/gitsigns.nvim", config = [[require('plugins.gitsigns')]], requires = "nvim-lua/plenary.nvim", event = "BufRead"}

    --> GENERAL
    use {"akinsho/nvim-toggleterm.lua", config = [[require('plugins.toggleterm')]], event = "BufEnter"} --TODO: DO I NEED THIS?
    use {"folke/which-key.nvim", config = [[require('plugins.which-key')]], event = "BufEnter"}
    use {'aspeddro/tex.nvim', config = [[require('plugins.tex')]], event = "BufEnter"}
    use {"ellisonleao/glow.nvim", ft = 'markdown'} --TODO: DO I NEED THIS? ALTERNATIVE MARKDOWN VIEWER?
    use {"lewis6991/impatient.nvim"}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

end)
