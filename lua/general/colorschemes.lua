local cmd = vim.cmd
local Theme = {}

--> AVAILABLE COLORSCHEMES FOR THE RANDOM THEME
local themes = {
    'tokyonight',
    'tokyodark',
    'rose-pine',
    'gruvbox-flat',
    'monokaipro',
    'dracula_pro',
    'nord',
    'catppuccin'
}

-- Function to prevent redundant code for each theme
function setColors(name, color)
    cmd("colorscheme"..(' ')..(name))
    cmd("hi BufferLineFill ctermbg="..("NONE"))
    cmd("hi NvimTreeNormal ctermbg="..("NONE"))
    if(color ~= nil) then
        cmd("hi StatusLine guibg="..(color))
        cmd("hi Staline guibg="..(color))
        cmd("hi BufferLineFill guibg="..( color))
        cmd("hi NvimTreeNormal guibg="..( color)) 
        cmd("hi NormalFloat guibg="..( color))
        cmd("hi WhichKeyFloat guibg="..( color)) 
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

function Theme.rosepine(transparent)
    require('general.colors.rosepine')

    setColors('rose-pine', nil)
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