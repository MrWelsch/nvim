local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup{
	options = {
		numbers = 'none',
        indicator = {
            icon = '▎',
            style = 'icon',
        },
        style_preset = {
            bufferline.style_preset.minimal,
        },
		-- indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 25,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 30,
		diagnostics = 'nvim_lsp',
		diagnostics_indicator = function(_, _, diagnostics_dict, _)
			local s = ' '
			for e, n in pairs(diagnostics_dict) do
				local sym = e == 'error' and ' '
					or (e == 'warning' and ' ' or ' ') -- TODO: FIX CLIPPING
				s = s .. n .. sym
			end
			return s
		end,
		-- NOTE: this will be called a lot so don't do any heavy processing here
		custom_filter = function(buf_number)
			if vim.bo[buf_number].filetype ~= 'dashboard' then
				return true
			end
		end,
		offsets = {
			{
				filetype = 'NvimTree',
				text = 'File Explorer',
				text_align = 'center',
			},
			{
				filetype = 'Outline',
				text = 'Symbols',
				text_align = 'center',
			},
			{
				filetype = 'packer',
				text = 'Plugins manager',
				text_align = 'center',
			},
		},
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = 'thin',
		enforce_regular_tabs = true,
		always_show_bufferline = false,
		sort_by = 'directory',
		custom_areas = {
			right = function()
				local result = {}
				local error = vim.lsp.diagnostic.get_count(0, [[Error]])
				local warning =
					vim.lsp.diagnostic.get_count(0, [[Warning]])
				local info =
					vim.lsp.diagnostic.get_count(0, [[Information]])
				local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

				if error ~= 0 then
					result[1] =
						{ text = '  ' .. error, fg = '#ff6c6b' }
				end

				if warning ~= 0 then
					result[2] =
						{ text = '  ' .. warning, fg = '#ECBE7B' }
				end

				if hint ~= 0 then
					result[3] =
						{ text = '  ' .. hint, fg = '#98be65' }
				end

				if info ~= 0 then
					result[4] =
						{ text = '  ' .. info, fg = '#51afef' }
				end
				return result
			end,
		},
	},
    -- Set the bufferline guibg to the same color as StatusLine which is defined in ui.colorschemes
    --TODO: Doesn't work
    -- highlights = {
    --     fill = {
    --         bg = {
    --             attribute = 'bg',
    --             highlight = 'StatusLine'
    --         }
    --         -- bg = 'NONE'
    --     },
    --     -- background = {
    --     --     bg = '#ffffff',
    --     -- },
    --     -- buffer_selected = {
    --     --     bg = '#282828', -- works
    --     -- },
    -- }
}