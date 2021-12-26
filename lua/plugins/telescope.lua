local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup{
	defaults = {
		vimgrep_arguments = {
			-- 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
			'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
		},
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = true,
			},
		},
		file_sorter =  require'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {'__pycache__', 'node_modules'},
		generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },

		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
	},
}

Telescope = {}

--> CUSTOM THEME
Telescope.custom_theme = {
	results_title = false,
	layout_strategy = "center",
	previewer = false,
	winblend = 30,
	layout_config = { width = 0.6, height = 0.6 },
	borderchars = {
		preview = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
		prompt = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
		results = { "═", " ", " ", " ", "╚", "╝", " ", " " },
	},
}

return Telescope