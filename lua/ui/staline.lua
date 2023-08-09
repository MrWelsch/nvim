local status_ok, staline = pcall(require, "staline")
if not status_ok then
    return
end

local sl_everforest = {
    i = "#7FBBB3",
	n = "#83C092",
	c = "#E69875",
	v = "#DBBC7F",
}

staline.setup {
	sections = {
		left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
		mid = {},
		right = {'file_name', 'line_column' }
	},
    -- mode_colors = sl_everforest,
	mode_colors = require"general.colors.gruvbox".staline, -- TODO: REFACTOR THIS SO THAT IT IS SET WITH COLOSCHEME
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " ",
        bg = 'none'
	},
    mode_icons = {
        n = " ",
        i = " ",
        c = " ",
        v = " "
    },
    lsp_symbols = {
        Error= require"general.misc".error,
        Info= require"general.misc".info,
        Warn= require"general.misc".warn,
        Hint= require"general.misc".hint,
    },
}