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
		layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        results_title = false,
	    previewer = true,
		file_sorter =  require'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {'__pycache__', 'node_modules'},
		generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = require"general.misc".border_telescope,

		color_devicons = true,
		use_less = true,
		path_display = { "truncate" },
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
	},
}

Telescope = {}

--> CUSTOM THEMES
Telescope.minimal_theme = {
	results_title = false,
	layout_strategy = "center",
	previewer = false,
	winblend = 0,
	layout_config = { width = 0.6, height = 0.6 },
	borderchars = {
		preview = require"general.misc".border_telescope,
		prompt = require"general.misc".border_telescope,
		results = require"general.misc".border_telescope,
	},
}

--NOTE: Needed for Which-Key ('telescope.builtin.diagnostics') to open diagnostics for the current buffer.
Telescope.document = {
    bufnr = 0,
}

return Telescope