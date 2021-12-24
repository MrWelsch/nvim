require "staline".setup {
	sections = {
		left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
		mid = {},
		right = {'file_name', 'line_column' }
	},
	mode_colors = {
		i = "#ab9df2",
		n = "#7bd88f",
		c = "#5ad4e6",
		v = "#fc9867",
	},
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " ",
        bg = '#1a1b26'
	}
}

local monokaipro = {
    i = "#ab9df2",
	n = "#7bd88f",
	c = "#5ad4e6",
	v = "#fc9867",  
}
