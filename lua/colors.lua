
local cmd = vim.cmd

-- GRUVBOX-FLAT
-- cmd[[colorscheme gruvbox-flat]]

-- vim.g.gruvbox_italic_functions = false
-- vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Enabling this option, will hide inactive statuslines and replace them with a thin border instead.
-- Should work with the standard StatusLine and LuaLine.
-- gruvbox_hide_inactive_statusline = false

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

-- DRACULA PRO
-- vim.g.dracula_colorterm = 0
-- cmd[[colorscheme dracula_pro]]

vim.g.monokaipro_filter = "spectrum"
-- vim.g.monokaipro_italic_functions = true
vim.g.monokaipro_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.monokaipro_flat_term = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.monokaipro_colors = { hint = "orange", error = "#ff0000" }


cmd[[colorscheme monokaipro]]

-- BUFFERLINE COLORS
cmd('hi! link BufferLineSeperator Default')

-- DASHBOARD COLORS
cmd('hi! default link DashboardHeader Number')
cmd('hi! default link DashboardCenter Operator')
cmd('hi! default link DashboardShortcut Identifier')
cmd('hi! default link DashboardFooter Function')

--vim.cmd('hi! default link EndOfBuffer guifg=bg guibg=bg ctermfg=bg ctermbg=bg')