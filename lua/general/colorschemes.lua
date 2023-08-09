local cmd = vim.cmd
local Theme = {}

--> AVAILABLE COLORSCHEMES FOR THE RANDOM THEME
local themes = {
    'tokyonight',
    'tokyodark',
    'rose-pine',
    'gruvbox-flat',
    'everforest',
    'monokaipro',
    'dracula_pro',
    'nord',
    'catppuccin'
}

-- Function to prevent redundant code for each theme
function setColors(name, color)
    cmd("colorscheme "..(name))
    cmd("hi BufferLineFill ctermbg="..("NONE"))
    cmd("hi NvimTreeNormal ctermbg="..("NONE"))
    -- cmd("hi FloatBorder guibg="..("NONE")) -- Disabled cmp borders
    --> TODO: SEE IF CLAUSE BELOW
    cmd("hi BufferLineFill guibg="..("NONE"))
    cmd("hi NvimTreeNormal guibg="..("NONE")) 
    cmd("hi NormalFloat guibg="..("NONE"))-- Doesn't affect cmp??
    cmd("hi WhichKeyFloat guibg="..("NONE"))
    -- TODO: Not Working.
    -- cmd("hi CmpPmenu guibg="..("#111111"))
    if(color ~= nil) then
        cmd("hi StatusLine guibg="..(color))
        cmd("hi Staline guibg="..(color))
        --> TODO: CHECK IF THESE ARE EXPLICITLY NEEDED FOR ALL THEMES
        -- cmd("hi BufferLineFill guibg="..(color))
        -- cmd("hi NvimTreeNormal guibg="..(color)) 
        -- cmd("hi NormalFloat guibg="..(color))
        -- cmd("hi WhichKeyFloat guibg="..(color)) 
    end
    if(name == 'gruvbox-flat') then
        local border = '#f2e5bc'
        cmd("hi TelescopePromptNormal guibg="..("NONE"))
        cmd("hi TelescopePromptBorder guibg="..("NONE"))
        cmd("hi TelescopePromptPrefix guibg="..("NONE"))
        cmd("hi TelescopePromptBorder guifg="..(border))
        cmd("hi TelescopePreviewBorder guifg="..(border))
        cmd("hi TelescopeResultsBorder guifg="..(border))
        cmd("hi LspInfoBorder guifg="..(border))
        cmd("hi DapUIFloatBorder guifg="..(border))

        -- Why is nothing working??
        -- cmd("hi DapUIValue guifg="..(border))
        -- cmd("hi DapUIFrameName guifg="..(border))
        -- cmd("hi DapUIVariable guifg="..(border))
        -- cmd("hi DapUICurrentFrame guifg="..(border))
        -- cmd("hi DapUINormal guifg="..(border))
        -- cmd("hi DapUIThread guifg="..(border))
        -- cmd("hi DapUIDecoration guifg="..(border))
        -- cmd("hi DapUIValue guifg="..(border))
        -- cmd("hi DapUIType guifg="..(border))
        -- cmd("hi DapUIScope guifg="..(border))
        -- cmd("hi DapUISource guifg="..(border))
        -- cmd("hi DapUIUnavailable guifg="..(border))
        -- cmd("hi DapUINormalNC guifg="..(border))
        -- cmd("hi DapUIUnavailableNC guifg="..(border))
        -- cmd("hi DapUIEndofBuffer guifg="..(border))
        cmd("hi DapUIModifiedValue guifg="..(border))
        cmd("hi DapUIStoppedThread guifg="..(border))
        cmd("hi DapUILineNumber guifg="..(border))
        cmd("hi DapUIFloatNormal guifg="..(border))
        cmd("hi DapUIWatchesEmpty guifg="..(border))
        cmd("hi DapUIWatchesValue guifg="..(border))
        cmd("hi DapUIWatchesError guifg="..(border))
        cmd("hi DapUIBreakpointsPath guifg="..(border))
        cmd("hi DapUIBreakpointsInfo guifg="..(border))
        cmd("hi DapUIBreakpointsLine guifg="..(border))
        cmd("hi DapUIBreakpointsDisabledLine guifg="..(border))
        cmd("hi DapUICurrentFrameName guifg="..(border))
        cmd("hi DapUIWinSelect guifg="..(border))
        cmd("hi DapUIPlayPauseNC guifg="..(border))
        cmd("hi DapUIRestartNC guifg="..(border))
        cmd("hi DapUIStopNC guifg="..(border))

        cmd("hi StatusLine guibg="..(color))
        cmd("hi StatusLine guifg="..('#ffffff'))
        cmd("hi StatusLineNC guibg="..(color)) -- this removes bar between nvimtree and staline
        cmd("hi StatusLineNC guifg="..('#ffffff'))
        cmd("hi Staline guibg="..(color))
    end
end

--> DEFINE THEME FUNCTIONS WHICH CAN BE APPLIED IN 'init.lua'
function Theme.random()
	math.randomseed(os.clock())
	local nice = math.random() * #themes
	local selected = themes[math.floor(nice)+1]
	print("ColorScheme: "..selected)

    setColors(selected, nil) --TODO: Refactor this to call the Theme."selected"
end

-- TODO: GENERALIZE BELOW FUNCTIONS AND MAKE 1 GENERIC FUNTION THAT GETS AN ARRAY AS INPUT
function Theme.tokyonight(transparent)
    require('general.colors.tokyonight')

    local BACKGROUND = require"general.colors.tokyonight".background
    cmd("hi FloatBorder guibg="..(BACKGROUND))
    setColors('tokyonight', BACKGROUND)
end

function Theme.tokyodark(transparent)
	require('general.colors.tokyodark')

    local BACKGROUND = require"general.colors.tokyodark".background
	cmd("hi Normal guibg="..(transparent and "none" or BACKGROUND))
    setColors('tokyodark', BACKGROUND)
end

function Theme.nord(transparent)
    require('general.colors.nord')

    local BACKGROUND = require"general.colors.nord".background
    setColors('nord', BACKGROUND)
end

function Theme.gruvbox(transparent)
    require('general.colors.gruvbox')

    local BACKGROUND = require"general.colors.gruvbox".background
    setColors('gruvbox-flat', BACKGROUND)
end

function Theme.everforest(transparent)
    require('general.colors.everforest')

    local BACKGROUND = require"general.colors.everforest".background
    setColors('everforest', BACKGROUND)
end

function Theme.rosepine(transparent)
    require('general.colors.rosepine')

    local BACKGROUND = require"general.colors.rosepine".background
    setColors('rose-pine', BACKGROUND)
end

function Theme.monokaipro(transparent)
    require('general.colors.monokaipro')

    local BACKGROUND = require"general.colors.monokaipro".background
    setColors('monokaipro', BACKGROUND)
end

function Theme.draculapro(transparent)
    require('general.colors.draculapro')

    local BACKGROUND = require"general.colors.draculapro".background
    setColors('dracula_pro', BACKGROUND)
end

function Theme.catppuccin(transparent)
    setColors('catppuccin', nil)
end

return Theme
