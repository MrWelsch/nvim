local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require'alpha.themes.dashboard'

--> HEADER
dashboard.section.header.val = {
    "                ",
    "                ",
    "                ",
    "                ",
    "                ",
    "                ",
    " ^ ^            ",
    "(O,O)           ",
    "(   ) minvim    ",
    "-'-'------------",
    "                ",
}

--> CONTENT
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", "<cmd>lua require('telescope.builtin').find_files(require('plugins.telescope').custom_theme)<cr>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

--> FOOTER
-- Function to return startup time
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

dashboard.section.footer.val = footer() -- apply custom footer

alpha.setup(dashboard.opts) -- apply settings