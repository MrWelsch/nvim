local status_ok, staline = pcall(require, "staline")
if not status_ok then
    return
end

staline.setup {
	sections = {
		left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
		mid = {'file_name'},
		right = {'line_column' }
	},
    inactive_sections = {
		left = {},
		mid = {'file_name'},
		right = {}
	},
	mode_colors = require"plugins.colorschemes.gruvbox".staline, -- TODO: REFACTOR THIS SO THAT IT IS SET WITH COLOSCHEME
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " ",
        bg = 'none',
        -- Needed to see buffer descriptions in dapui
        inactive_color  = "#f2e5bc",
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