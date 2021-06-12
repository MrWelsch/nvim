local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

-- Auto compile if there are changes in plugins.lua
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"
return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    use {"neovim/nvim-lspconfig", opt = true}
    use {"glepnir/lspsaga.nvim", opt = true}
    use {"kabouzeid/nvim-lspinstall", opt = true}
    use {"folke/trouble.nvim", opt = true}

    -- TELESCOPE
    use {"nvim-lua/popup.nvim", opt = true}
    use {"nvim-lua/plenary.nvim", opt = true}
    use {"nvim-telescope/telescope.nvim", opt = true}
    use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
    use {"nvim-telescope/telescope-project.nvim", opt = true}

    -- DEBUGGING
    use {"mfussenegger/nvim-dap", opt = true}

    -- AUTOCOMPLETE
    use {"hrsh7th/nvim-compe", opt = true}

    -- TREESITTER
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"windwp/nvim-ts-autotag", opt = true}
    use {'andymass/vim-matchup', opt = true}

    -- EXPLORER
    --use {"kyazdani42/nvim-tree.lua", opt = true}
    use {"tamago324/lir.nvim", opt = true}
    -- This puts nvim-tree in curdir
    use {"ahmedkhalf/lsp-rooter.nvim", opt = true}

    -- TERMINAL
    use {'akinsho/nvim-toggleterm.lua'}

    -- GIT
    use {"lewis6991/gitsigns.nvim", opt = true}
    use {'f-person/git-blame.nvim', opt = true}

    -- UNDOTREE
    use {"mbbill/undotree", opt=true}

    -- KEYBINDS
    use {"folke/which-key.nvim", opt = true}

    -- MISCELLANIOUS
    use {"glepnir/dashboard-nvim", opt = true}
    use {"kyazdani42/nvim-web-devicons", opt = true}
    use {"windwp/nvim-autopairs", opt = true}
    use {"kevinhwang91/nvim-bqf", opt = true}
    use {'norcalli/nvim-colorizer.lua', opt = true}

    -- LATEX
    use {'lervag/vimtex', opt = true}

    -- COMMENTING
    use {"terrortylor/nvim-comment", opt = true}
    use {'JoosepAlviste/nvim-ts-context-commentstring', opt = true}

    -- STATUS & BUFFERLINE
    use {"glepnir/galaxyline.nvim", opt = true}
    use {"romgrk/barbar.nvim", opt = true}

    -- LIVE SERVER
    use {'turbio/bracey.vim', run = 'npm install --prefix server', opt = true}

    require_plugin("nvim-lspconfig")
    require_plugin("lspsaga.nvim")
    require_plugin("nvim-lspinstall")
    require_plugin('trouble.nvim')
    require_plugin("friendly-snippets")
    require_plugin("popup.nvim")
    require_plugin("plenary.nvim")
    require_plugin("telescope.nvim")
    require_plugin('telescope-project.nvim')
    require_plugin("nvim-dap")
    require_plugin("nvim-compe")
    require_plugin("vim-vsnip")
    require_plugin("nvim-treesitter")
    require_plugin("nvim-ts-autotag")
    require_plugin('vim-matchup')
    require_plugin("nvim-tree.lua")
    require_plugin("gitsigns.nvim")
    require_plugin("git-blame.nvim")
    require_plugin("which-key.nvim")
    require_plugin("dashboard-nvim")
    require_plugin("nvim-autopairs")
    require_plugin("nvim-comment")
    require_plugin("nvim-bqf")
    require_plugin("nvim-web-devicons")
    require_plugin("galaxyline.nvim")
    require_plugin("barbar.nvim")
    require_plugin('lsp-rooter.nvim')
    require_plugin("TrueZen.nvim")
    require_plugin("nvim-ts-context-commentstring")
    require_plugin('bracey.vim')
    require_plugin('nvim-colorizer.lua')
    require_plugin('vimtex')
    require_plugin('nvim-toggleterm.lua')
    require_plugin('undotree')
    require_plugin('lir.nvim')

end)
