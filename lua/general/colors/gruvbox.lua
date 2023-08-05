vim.g.gruvbox_italic_functions = false
-- Set a darker background on sidebar-like windows. For example: ["qf", "vista_kind", "terminal", "packer"]
-- vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- Enabling this option, will hide inactive statuslines and replace them with a thin border instead.
-- Should work with the standard StatusLine and LuaLine.
vim.g.gruvbox_hide_inactive_statusline = false
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }
gruvbox_transparent = false
-- Sidebar like windows like NvimTree get a darker background
gruvbox_dark_sidebar = false
-- Float windows like the lsp diagnostics windows get a darker background.
gruvbox_dark_float = false

--> SET THEME-SPECIFIC COLORS
Color = {}

Color.background = '#32302f'
Color.staline = {
    i = "#7daea3",
	n = "#a9b665",
	c = "#89b482",
	v = "#e78a4e",  
} 

return Color