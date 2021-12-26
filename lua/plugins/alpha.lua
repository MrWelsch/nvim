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
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
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
    string = "loaded in " .. vim.fn.printf(
        "%.3f",
        vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
    ) .. " seconds."
    return tostring(string)
end

dashboard.section.footer.val = footer() -- apply custom footer

alpha.setup(dashboard.opts) -- apply settings