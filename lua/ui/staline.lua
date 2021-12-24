local monokaipro = {
    i = "#ab9df2",
	n = "#7bd88f",
	c = "#5ad4e6",
	v = "#fc9867",  
}

local tokyonight_night = {
    i = "#bb9af7",
	n = "#9ece6a",
	c = "#7aa2f7",
	v = "#ff9e64",  
}

local tokyodark = {
    i = "#A485DD",
	n = "#95C561",
	c = "#7199EE",
	v = "#D7A65F",  
}

local gruvbox = {
    i = "#7daea3",
	n = "#a9b665",
	c = "#89b482",
	v = "#e78a4e",  
}

local nord = {
    i = "#B48EAD",
	n = "#A3BE8C",
	c = "#88C0D0",
	v = "#EBCB8B",  
}

local draculapro = {
    i = "#9580ff",
	n = "#8aff80",
	c = "#80ffea",
	v = "#ff9580",  
}

require "staline".setup {
	sections = {
		left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
		mid = {},
		right = {'file_name', 'line_column' }
	},
	mode_colors = tokyonight_night,
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " ",
        bg = 'none'
	}
}
