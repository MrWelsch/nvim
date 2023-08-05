-- Make sidebars and popup menus like nvim-tree and telescope have a different background
vim.g.nord_contrast = true
-- Enable the border between verticaly split windows visable
vim.g.nord_borders = false
-- Disable the setting of background color so that NeoVim can use your terminal background
vim.g.nord_disable_background = false
-- Set the cursorline transparent/visible
vim.g.nord_cursorline_transparent = false
-- Re-enables the backgrond of the sidebar if you disabled the background of everything
vim.g.nord_enable_sidebar_background = false
-- Enables/Disables italics
vim.g.nord_italic = false

--> SET THEME-SPECIFIC COLORS
Color = {}

Color.background = '#2E3440'
Colors.staline = {
    i = "#B48EAD",
	n = "#88C0D0",
	c = "#A3BE8C",
	v = "#EBCB8B",  
}

return Color