require("which-key").setup {
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
        group = "" -- symbol prepended to a group
    },
    window = {
        border = "none", -- none, single, double, shadow
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

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local mappings = {
    [";"] = "DASHBOARD",
    ["/"] = "COMMENT",
    ["c"] = "CLOSE BUFFER",
    ["e"] = "EXPLORER",
    ["f"] = "FIND FILE",
    -- ["f"] = {"<cmd>:lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<cr>", "Find File"},
    ["g"] = "GIT",
    ["t"] = "TERMINAL",
    ["p"] = "PROJECTS",
    -- d = {
    --     name = "+ DIAGNOSTICS",
    --     t = {"<cmd>TroubleToggle<cr>", "trouble"},
    --     w = {"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace"},
    --     d = {"<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document"},
    --     q = {"<cmd>TroubleToggle quickfix<cr>", "quickfix"},
    --     l = {"<cmd>TroubleToggle loclist<cr>", "loclist"},
    --     r = {"<cmd>TroubleToggle lsp_references<cr>", "references"},
    -- },
    l = {
        name = "+ LSP",
        a = {"<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>", "Code Actions"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
		F = {"<cmd>FormatWrite<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"}
    },
    s = {
        name = "+ SEARCH",
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"}
    },
    S = {
		name = "+ SESSION",
    	s = {"<cmd>SessionSave<cr>", "Save Session"},
		l = {"<cmd>SessionLoad<cr>", "Load Session"}
    },
    -- extras
    L = {
        name = "+ LATEX",
        c = {"<cmd>TexCompile<cr>", "compile"},
        p = {"<cmd>TexViewer<cr>", "preview"},
        t = {"<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview"},
    },
}

local wk = require("which-key")
wk.register(mappings, opts)