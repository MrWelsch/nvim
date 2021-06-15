
local cmd = vim.cmd

-- GRUVBOX-FLAT
vim.cmd[[colorscheme gruvbox-flat]]

vim.g.gruvbox_italic_functions = false
vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }

--Enabling this option, will hide inactive statuslines and replace them with a thin border instead.
--Should work with the standard StatusLine and LuaLine.
gruvbox_hide_inactive_statusline = false

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

-- DRACULA PRO
--vim.g.dracula_colorterm = 0
--cmd('colorscheme dracula_pro_van_helsing')

-- DISABLE COLOR SCHEME BACKGROUND COLORS (TRANSLUCENT)
--highlight Normal ctermbg=none guibg=none
--highlight SignColumn ctermbg=none guibg=none
--highlight LineNr ctermbg=none guibg=none

-- DASHBOARD COLORS
cmd('hi! default link DashboardHeader Number')
cmd('hi! default link DashboardCenter Operator')
cmd('hi! default link DashboardShortcut Identifier')
cmd('hi! default link DashboardFooter Function')

--vim.cmd('hi! default link EndOfBuffer guifg=bg guibg=bg ctermfg=bg ctermbg=bg')