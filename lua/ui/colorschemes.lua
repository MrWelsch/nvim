local cmd = vim.cmd

local Theme = {}

--> AVAILABLE COLORSCHEMES FOR THE RANDOM THEME
local themes = {
    'tokyonight',
    'tokyodark',
    'gruvbox-flat',
    'monokaipro',
    'dracula_pro',
    'nord'
}

--> DEFINE THEME FUNCTIONS WHICH CAN BE APPLIED IN 'init.lua'
function Theme.random()
	math.randomseed(os.clock())
	local nice = math.random() * #themes
	local selected = themes[math.floor(nice)+1]
	print("ColorScheme: "..selected)
	cmd ('colorscheme '..selected)
end

function Theme.tokyonight(transparent)
    vim.g.tokyonight_style = "night"
	vim.g.tokyonight_italic_keywords = true
	vim.g.tokyonight_italic_functions = true
	-- vim.g.tokyonight_style = "night"
	-- vim.g.tokyonight_transparent_background = transparent and 1 or 0
	vim.g.tokyonight_transparent = transparent and 1 or 0
    vim.g.tokyonight_transparent_sidebar = true

	cmd [[colorscheme tokyonight]]
	cmd [[hi NormalFloat guibg=#1a1b26]]
    cmd [[hi FloatBorder guibg=#1a1b26]]
	-- vim.cmd [[hi SignColumn guibg=#1a1b26]]
    cmd [[hi StatusLine guibg=#1a1b26]]
    cmd [[hi Staline guibg=#1a1b26]]
end

function Theme.tokyodark(transparent)
	vim.g.tokyodark_transparent_background = true
	vim.g.tokyodark_enable_italic = true

	cmd [[colorscheme tokyodark]]
	cmd("hi Normal guibg="..(transparent and "none" or "#11121d"))
	cmd [[hi IndentBlanklineChar guifg=#555555]]
    cmd [[hi StatusLine guibg=#11121d]]
    cmd [[hi Staline guibg=#11121d]]
end

function Theme.nord(transparent)
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
	cmd [[colorscheme nord]]
    cmd [[hi StatusLine guibg=#2E3440]]
    cmd [[hi Staline guibg=#2E3440]]
end

function Theme.gruvbox(transparent)
    vim.g.gruvbox_italic_functions = false
    vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }
    -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead.
    -- Should work with the standard StatusLine and LuaLine.
    vig.g.gruvbox_hide_inactive_statusline = false
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }
    cmd [[colorscheme gruvbox-flat]]
    cmd [[hi StatusLine guibg=##32302f]]
    cmd [[hi Staline guibg=##32302f]]
end

function Theme.monokaipro(transparent)
    vim.g.monokaipro_filter = "spectrum"
    -- vim.g.monokaipro_italic_functions = true
    vim.g.monokaipro_sidebars = { "qf", "vista_kind", "terminal", "packer" }
    vim.g.monokaipro_flat_sidebar = true
    vim.g.monokaipro_flat_term = true
    vim.g.monokaipro_hide_inactive_statusline = true
    -- -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    vim.g.monokaipro_colors = { hint = "orange", error = "#ff6188" }
    cmd [[colorscheme monokaipro]]
    cmd [[hi StatusLine guibg=#222222]]
    cmd [[hi Staline guibg=#222222]]
end

function Theme.draculapro(transparent)
    vim.g.dracula_colorterm = 0
    cmd [[colorscheme dracula_pro]]
    cmd [[hi StatusLine guibg=#22212c]]
    cmd [[hi Staline guibg=#22212c]]
end

return Theme

-- BORDERS ARE CONFIGURED IN: telescope.lua, which-key.lua, cmp.lua, handlers.lua
-- local double = "═", "║", "═", "║", "╔", "╗", "╝", "╚"
-- local rounded = "─", "│", "─", "│", "╭", "╮", "╯", "╰"