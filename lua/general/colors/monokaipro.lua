vim.g.monokaipro_filter = "spectrum"
-- vim.g.monokaipro_italic_functions = true
vim.g.monokaipro_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.monokaipro_flat_sidebar = true
vim.g.monokaipro_flat_term = true
vim.g.monokaipro_hide_inactive_statusline = true
-- -- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.monokaipro_colors = { hint = "orange", error = "#ff6188" }

--> SET THEME-SPECIFIC COLORS
Color = {}

Color.background = '#222222'
Colors.staline = {
    i = "#ab9df2",
	n = "#7bd88f",
	c = "#5ad4e6",
	v = "#fc9867",  
}

return Color