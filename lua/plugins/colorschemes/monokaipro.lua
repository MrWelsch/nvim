return {
    'https://gitlab.com/__tpb/monokai-pro.nvim', 
    lazy = true,
    config = function()
        vim.g.monokaipro_filter = "spectrum"
        -- vim.g.monokaipro_italic_functions = true
        vim.g.monokaipro_sidebars = { "qf", "vista_kind", "terminal", "packer" }
        vim.g.monokaipro_flat_sidebar = true
        vim.g.monokaipro_flat_term = true
        vim.g.monokaipro_hide_inactive_statusline = true
        -- -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        vim.g.monokaipro_colors = { hint = "orange", error = "#ff6188" }
    end
}