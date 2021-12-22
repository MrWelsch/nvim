local lualine = require'lualine'

-- COLOR SCHEME CONFIGURATION
local colors = {
    -- Dracula_Pro
    -- black = '#22212C',
    -- Dracula_Pro_Helsing
    -- blue   = '#9580FF',
    -- cyan   = '#80FFEA',
    -- black  = '#0B0D0F',
    -- white  = '#f8f8f2',
    -- red    = '#FF9580',
    -- violet = '#9580FF',
    -- grey   = '#454158',

	-- GRUVBOX-FLAT
    -- blue   = '#7daea3',
    -- cyan   = '#89b482',
    -- black  = '#32302f',
    -- white  = '#d4be98',
    -- red    = '#ea6962',
    -- violet = '#d3869b',
    -- grey   = '#3c3836',

    -- MONOKAI PRO (SPECTRUM)
    blue   = '#3399cc',
    cyan   = '#5ad4e6',
    black  = '#222222',
    white  = '#f7f1ff',
    red    = '#ff6188',
    violet = '#ab9df2',
    grey   = '#544f56',
}

-- THEME CONFIGURATION
local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.black },
    },

    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}

-- SETUP
lualine.setup {
    options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
        disabled_filetypes = { "alpha", "NvimTree", "Outline" },
    },
    sections = {
        lualine_a = {
        { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
}