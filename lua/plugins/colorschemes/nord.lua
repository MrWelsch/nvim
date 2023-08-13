return {
    'shaunsingh/nord.nvim',
    lazy = true,
    config = function()
        -- Make sidebars and popup menus like nvim-tree and telescope have a different background
        vim.g.nord_contrast = false
        -- Enable the border between verticaly split windows visable
        vim.g.nord_borders = true
        -- Disable the setting of background color so that NeoVim can use your terminal background
        vim.g.nord_disable_background = false
        -- Set the cursorline transparent/visible
        vim.g.nord_cursorline_transparent = false
        -- Re-enables the backgrond of the sidebar if you disabled the background of everything
        vim.g.nord_enable_sidebar_background = false
        -- Enables/Disables italics
        vim.g.nord_italic = true
        -- enables/disables colorful backgrounds when used in diff mode
        vim.g.nord_uniform_diff_background = false
        -- enables/disables bold
        vim.g.nord_bold= true

        -- Turns of LSP Semantic Tokens (NVIM 0.9.0+)
        -- (Prevents white text from being turned blue)
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            client.server_capabilities.semanticTokensProvider = nil
            end,
        })

        require('nord').set()
    end
}