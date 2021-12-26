local status_ok, key = pcall(require, "which-key")
if not status_ok then
    return
end

key.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "" -- symbol prepended to a group
    },
    window = {
        border = require"general.misc".border, -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

--> OPTIONS APPLIED TO EACH MAPPING
local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

--> SET MAPPINGS
local mappings = {
    -- STANDARD MAPPINGS
    [";"] =                                                                                                             " DASHBOARD",
    ["/"] =                                                                                                             " COMMENT",
    ["e"] =                                                                                                             "פּ EXPLORER",
    ["h"] =                                                                                                             "ײַ HORIZONTAL SPLIT",
    ["q"] =                                                                                                             " QUIT",
    ["s"] =                                                                                                             " SAVE",
    ["t"] =                                                                                                             " TERMINAL",
    ["v"] =                                                                                                             "ﬠ VERTICAL SPLIT",
    ["w"] =                                                                                                             " CLOSE BUFFER",

    -- MENUS
    l = {
        name = "ﭧ LSP",
        a = {"<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>",    " CODE ACTIONS"},
        d = {"<cmd>Telescope diagnostics buffnr=0<cr>",                                                                 " DOCUMENT DIAGNOSTICS"},
        D = {"<cmd>Telescope diagnostics<cr>",                                                                          " WORKSPACE DIAGNOSTICS"},
		f = {"<cmd>FormatWrite<cr>",                                                                                    " FORMAT"},
        i = {"<cmd>LspInfo<cr>",                                                                                        " INFO"},
        m = {
            name = " MARKDOWN",
            c = {"<cmd>TexCompile<cr>",                                                                                 " COMPILE"},
            l = {"<cmd>TexViewer<cr>",                                                                                  " LATEX PREVIEW"},
            p = {"<cmd>Glow<cr>",                                                                                       " MARKDOWN PREVIEW"},
        },
        -- QUICKFIX NOT YET WORKING                                                                                    
        q = {"<cmd>Telescope quickfix<cr>",                                                                             " Quickfix"},
        x = {"<cmd>cclose<cr>",                                                                                         " Close Quickfix"},
    },
    f = {
        name = " FIND",
        f = {"<cmd>lua require('telescope.builtin').find_files(require('plugins.telescope').custom_theme)<cr>",         " FILE"},
        m = {"<cmd>Telescope marks<cr>",                                                                                " MARKS"},
        M = {"<cmd>Telescope man_pages<cr>",                                                                            " MAN PAGES"},
        p = {"<cmd>Telescope projects<cr>",                                                                             " PROJECTS"},
        r = {"<cmd>Telescope oldfiles<cr>",                                                                             " RECENT FILES"},
        R = {"<cmd>Telescope registers<cr>",                                                                            " REGISTERS"},
        t = {"<cmd>Telescope live_grep<cr>",                                                                            " TEXT"},
    },
    c = {
        name = "漣CONFIG",
        c = {"<cmd>PackerCompile<cr>",                                                                                  " COMPILE"},
        p = {"<cmd>PackerProfile<cr>",                                                                                  " PROFILE"},
        s = {"<cmd>PackerSync<cr>",                                                                                     "痢 SYNC"},    
        t = {"<cmd>Telescope colorscheme<cr>",                                                                          " THEME"},
    },
    g = {
        name = " GIT",
        b = {"<cmd>Telescope git_branches<cr>",                                                                         " BRANCHES"},
        l = {"<cmd>lua_lazygit_toggle()<cr>",                                                                           " LAZYGIT"},    
    },
    d = {
		name = " DEBUG",
    	b = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>",                                                           " BREAKPOINT"},
		c = {"<cmd>lua require'dap'.continue()<cr>",                                                                    " CONTINUE"},
        h = {"<cmd>help dap-api<cr>",                                                                                   " HELP"},
		i = {"<cmd>lua require'dap'.step_into()<cr>",                                                                   " STEP INTO"},
        k = {"<cmd>help dap-mapping<cr>",                                                                               " KEYBINDS"},
        o = {"<cmd>lua require'dap'.step_over()<cr>",                                                                   " STEP OVER"},
        s = {"<cmd>lua require'dap'.repl.open()<cr>",                                                                   " INSPECT STATE"},
    },
}

--> APPLY MAPPINGS AND OPTIONS
local wk = require("which-key")
wk.register(mappings, opts)
