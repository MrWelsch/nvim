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
		branch_symbol = " "
	}
}

-- MONOKAI PRO (SPECTRUM)
-- bg       = '#222222',
-- fg       = '#f7f1ff',
-- yellow   = '#fce566',
-- cyan     = '#5ad4e6',
-- darkblue = '#3399cc',
-- green    = '#7bd88f',
-- orange   = '#fc9867',
-- violet   = '#ab9df2',
-- magenta  = '#ff6188',
-- blue     = '#3399cc',
-- red      = '#ff6188',
