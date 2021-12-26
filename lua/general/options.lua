--> VIM BASE CONFIG
--> For information on each option use ':h <optionname>'
local cmd = vim.cmd

local options = {
    -- GENERAL
    hidden = true,
    undofile = true,
    undodir = "/Users/nico/.cache/nvim/undodir",
    swapfile = false,
    mouse = "a",
    clipboard = "unnamedplus",
    inccommand = "split",
    signcolumn = "yes",
    belloff = "all",
    completeopt = "menuone,noselect",

    -- PERFORMANCE
    updatetime = 300,
    timeoutlen = 100,

    -- VISUAL
    termguicolors = true,
    cmdheight = 1,
    showmode = false,
    number = true,
    relativenumber = true,
    cursorline = false,
    fillchars = { eob = " " },

    -- EDITOR
    splitbelow = true,
    splitright = true,

    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,

    smartindent = true,

    hlsearch = false,
    incsearch = true,

    wrap = false,
    textwidth = 80,
    -- colorcolumn = '80',

    scrolloff = 10,
}

-- Loop to iterate over options
for k, v in pairs(options) do
    vim.opt[k] = v
end

--> GLOBAL
vim.g.auto_complete = true
vim.g.nobackup = true

--> VIM COMMAND
cmd('set iskeyword+=-')
cmd('set shortmess+=c')
cmd('set whichwrap+=<,>,[,],h,l')
--cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])