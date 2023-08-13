return {
    'folke/tokyonight.nvim',
    lazy = true,
    config = function()
        vim.g.tokyonight_style = "night"
        vim.g.tokyonight_italic_keywords = true
        vim.g.tokyonight_italic_functions = true
        -- vim.g.tokyonight_style = "night"
        -- vim.g.tokyonight_transparent_background = transparent and 1 or 0
        vim.g.tokyonight_transparent = transparent and 1 or 0
        vim.g.tokyonight_transparent_sidebar = true
    end
}