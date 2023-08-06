local status_ok, starter = pcall(require, "mini.starter")
if not status_ok then
    return
end

-- Function to return a customized footer
local function footer()
    local date = os.date("  %m-%d-%Y")
    local plugins_count = "     " .. vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
    local string = "     " .. vim.fn.printf(
        "%.3f",
        vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
    ) .. "s"
    local version = vim.version()
    local nvim_version_info = "     v" .. version.major .. "." .. version.minor .. "." .. version.patch
    return date .. plugins_count .. tostring(string) .. nvim_version_info
end

-- Plugin Config
starter.setup({
    -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
    -- started with intent to show something else.
    autoopen = true,
  
    -- Whether to evaluate action of single active item
    evaluate_single = false,
  
    -- Items to be displayed. Should be an array with the following elements:
    -- - Item: table with <action>, <name>, and <section> keys.
    -- - Function: should return one of these three categories.
    -- - Array: elements of these three types (i.e. item, array, function).
    -- If `nil` (default), default items will be used (see |mini.starter|).
    -- items = nil,
    items = {
        starter.sections.recent_files(10, false),
        { action = "lua require('telescope.builtin').find_files(require('plugins.telescope').custom_theme)", name = "F:  Find File", section = "Telescope" },
        { action = "lua require('telescope.builtin').live_grep(require('plugins.telescope').custom_theme)", name = "T:  Find Text", section = "Telescope" },
        -- { action = "lua require('telescope.builtin').projects(require('plugins.telescope').custom_theme)", name = "P: Find Project", section = "Telescope" },
		{ action = "Lazy update", name = "U: 痢 Update Plugins", section = "Plugins" },
		{ action = "enew", name = "E:  New Buffer", section = "Builtin actions" },
		{ action = ":e ~/.config/nvim/init.lua", name = "C:  Configuration", section = "Builtin actions" },
        { action = "qall!", name = "Q:  Quit", section = "Builtin actions" },
	},
  
    -- Header to be displayed before items. Converted to single string via
    -- `tostring` (use `\n` to display several lines). If function, it is
    -- evaluated first. If `nil` (default), polite greeting will be used.
    header = nil,
  
    -- Footer to be displayed after items. Converted to single string via
    -- `tostring` (use `\n` to display several lines). If function, it is
    -- evaluated first. If `nil` (default), default usage help will be shown.
    footer = footer(),
  
    -- Array  of functions to be applied consecutively to initial content.
    -- Each function should take and return content for 'Starter' buffer (see
    -- |mini.starter| and |MiniStarter.content| for more details).
    content_hooks = nil,
  
    -- Characters to update query. Each character will have special buffer
    -- mapping overriding your global ones. Be careful to not add `:` as it
    -- allows you to go into command mode.
    query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',
})