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
function setColors(name, colors, highlights)
    cmd("colorscheme "..(name))
    if(colors or highlights ~= nil) then
        local bg = colors.background
        local border = colors.border
        local green = colors.green
        local blue = colors.blue
        local cyan = colors.cyan
        local red = colors.red

        for i, v in pairs(highlights.transparent) do
            set_highlight(v, ("NONE"))
        end
        for i, v in pairs(highlights.bg) do
            set_highlight(v, bg)
        end
        for i, v in pairs(highlights.border) do
            set_highlight(v, border)
        end
        for i, v in pairs(highlights.green) do
            set_highlight(v, green)
        end
        for i, v in pairs(highlights.blue) do
            set_highlight(v, blue)
        end
        for i, v in pairs(highlights.cyan) do
            set_highlight(v, cyan)
        end
        for i, v in pairs(highlights.red) do
            set_highlight(v, red)
        end

        -- TODO: Not working yet (Above (under if) can be commented out to test)
        -- ERROR: Line 61: attempt to concatenate local 'highlight' (a nil value)
        -- for i, c in ipairs(colors) do --NOTE: Limit this to Max-1 cause staline colors
        --     for j, h in ipairs (highlights) do
        --         set_highlight(h[j], c[i])
        --     end
        -- end
    end
end

function set_highlight(highlight, color)
    cmd(highlight..color)
end

--> DEFINE THEME FUNCTIONS WHICH CAN BE APPLIED IN 'init.lua'
function Theme.random()
	math.randomseed(os.clock())
	local nice = math.random() * #themes
	local selected = themes[math.floor(nice)+1]
	print("ColorScheme: "..selected)

    setColors(selected, nil, nil) --TODO: Refactor this to call the Theme."selected"
end

-- TODO: GENERALIZE BELOW FUNCTIONS AND MAKE 1 GENERIC FUNTION THAT GETS AN ARRAY AS INPUT
function Theme.tokyonight(transparent)
    require('general.colors.tokyonight')

    local COLORS = require"general.colors.tokyonight"
    local HIGHLIGHTS = require"general.colors.highlights"
    cmd("hi FloatBorder guibg="..(COLORS))
    setColors('tokyonight', COLORS, HIGHLIGHTS)
end

function Theme.tokyodark(transparent)
	require('general.colors.tokyodark')

    local COLORS = require"general.colors.tokyodark"
    local HIGHLIGHTS = require"general.colors.highlights"
	cmd("hi Normal guibg="..(transparent and "none" or COLORS))
    setColors('tokyodark', COLORS, HIGHLIGHTS)
end

function Theme.nord(transparent)
    require('general.colors.nord')

    local COLORS = require"general.colors.nord"
    local HIGHLIGHTS = require"general.colors.highlights"
    setColors('nord', COLORS, HIGHLIGHTS)
end

function Theme.gruvbox(transparent)
    require('general.colors.gruvbox')

    local COLORS = require"general.colors.gruvbox"
    local HIGHLIGHTS = require"general.colors.highlights"
    setColors('gruvbox-flat', COLORS, HIGHLIGHTS)
end

function Theme.everforest(transparent)
    require('general.colors.everforest')

    local COLORS = require"general.colors.everforest"
    local HIGHLIGHTS = require"general.colors.highlights"
    setColors('everforest', COLORS, HIGHLIGHTS)
end

function Theme.rosepine(transparent)
    require('general.colors.rosepine')

    local COLORS = require"general.colors.rosepine"
    local HIGHLIGHTS = require"general.colors.highlights"
    setColors('rose-pine', COLORS)
end

function Theme.monokaipro(transparent)
    require('general.colors.monokaipro')

    local COLORS = require"general.colors.monokaipro"
    local HIGHLIGHTS = require"general.colors.highlights"
    setColors('monokaipro', COLORS, HIGHLIGHTS)
end

function Theme.draculapro(transparent)
    require('general.colors.draculapro')

    local COLORS = require"general.colors.draculapro"
    local HIGHLIGHTS = require"general.colors.highlights"
    setColors('dracula_pro', COLORS, HIGHLIGHTS)
end

function Theme.catppuccin(transparent)
    setColors('catppuccin', nil, nil)
end

return Theme
