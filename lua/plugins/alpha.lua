
local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
    string = "loaded in " .. vim.fn.printf(
        "%.3f",
        vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
    ) .. " seconds."
    return tostring(string)
end

dashboard.section.footer.val = footer()

alpha.setup(dashboard.opts)