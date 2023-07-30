--> VIM BASE CONFIG
--> For information on each option use ':h <optionname>'
local cmd = vim.cmd

local options = {
    -- GENERAL
    undofile = true,
    undodir = "/Users/nico/.cache/nvim/undodir",
    swapfile = false,
    backup = false,
    writebackup = false,
    mouse = "a", -- Enable mouse
    clipboard = "unnamedplus", -- Set clipboard behaviour
    inccommand = "split",
    signcolumn = "yes",
    belloff = "all",
    completeopt = "menuone,noselect", -- Set when to toggle completion menu
    ignorecase = true, -- Case-sensitive searching UNLESS \C or capital in search
    smartcase = true,

    -- PERFORMANCE
    updatetime = 300,
    timeoutlen = 100,
    laststatus= 2, -- Needed for staline

    -- VISUAL
    termguicolors = true, -- Toggle termgui colors
    cmdheight = 1, -- Height of the command line
    pumheight = 10, -- Number of items in completion menu
    pumblend = 30, -- Opacity of completion menu
    showmode = false, -- Hides the mode while in telescope
    ruler= false, -- Hides the ruler while in telescope
    cursorline = false, -- Toggle cursor line
    relativenumber = true, -- Shows line numbers relative to cursor
    number = true, -- Shows current line number
    fillchars = {eob=' ', fold=' ', foldopen="", foldsep=" ", foldclose=""}, -- remove fillchars
	-- list = true, -- Enables listchars
	-- listchars = 'tab:▏ ', -- Changes tab indicator

    -- EDITOR
    splitbelow = true, -- Toggle vertical splitting
    splitright = true, -- Toggle horizontal splitting

    tabstop = 4, -- Number of spaces that a <Tab> counts for
    shiftwidth = 4, -- Number of spaces while indenting
    softtabstop = 0, -- 0 = disabled
    expandtab = false, -- Changes the appropriate number of spaces to a <Tab>

    smartindent = true, -- Auto-Indenting while starting a new line
    breakindent = true,

    hlsearch = false, -- Toggle highlighting of search results
    incsearch = true, -- While searching show pattern matches

    wrap = false,
    textwidth = 80,
    -- colorcolumn = '80',

    scrolloff = 10,
}

-- Loop to iterate over options
for k, v in pairs(options) do
    vim.opt[k] = v
end

--> VIM COMMAND
cmd('set iskeyword+=-')
cmd('set shortmess+=c')
cmd('set whichwrap+=<,>,[,],h,l')
--cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
