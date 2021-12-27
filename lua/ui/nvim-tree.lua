--> SET ADDITIONAL OPTIONS (Before calling require'nvim-tree')
vim.g.nvim_tree_highlight_opened_files = true -- enable folder and file icon highlight for opened files/directories.
    
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
    folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
}

local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

tree.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {'alpha'},
    auto_close          = true,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = true,
    update_to_buf_dir   = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
        }
    },
    update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {
            '.git',
            '*.aux',
            '*.bbl',
            '*.bcf',
            '*.blg',
            '*.fdb_latexmk',
            '*.fls',
            '*.gz',
            '*.ilg',
            '*.lof',
            '*.lol',
            '*.lot',
            '*.nav',
            '*.out',
            '*.snm',
            '*.toc',
            '*.vrb',
            '*.xdv',
            '*.pyg',
            'node_modules',
            '.cache'
        }
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 35,
        height = 30,
        hide_root_folder = false,
        side = 'right',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {
                -- { key = "<CR>",             cb = tree_cb("edit") },
                -- { key = "o",                cb = tree_cb("edit") },
                -- { key = "l",                cb = tree_cb("edit") },
                -- { key = "<2-LeftMouse>",    cb = tree_cb("edit") },
                -- { key = "<2-RightMouse>",   cb = tree_cb("cd") },
                -- { key = "<C-]",             cb = tree_cb("cd") },
                -- { key = "v",                cb = tree_cb("vsplit") },
                -- { key = "s",                cb = tree_cb("split") },
                -- { key = "<C-t>",            cb = tree_cb("tabnew") },
                -- { key = "<",                cb = tree_cb("prev_sibling") },
                -- { key = ">",                cb = tree_cb("next_sibling") },
                -- { key = "<BS>",             cb = tree_cb("close_node") },
                -- { key = "h",                cb = tree_cb("close_node") },
                -- { key = "<S-CR>",           cb = tree_cb("close_node") },
                -- { key = "<Tab>",            cb = tree_cb("preview") },
                -- { key = "I",                cb = tree_cb("toggle_ignored") },
                -- { key = "H",                cb = tree_cb("toggle_dotfiles") },
                -- { key = "R",                cb = tree_cb("refresh") },
                -- { key = "a",                cb = tree_cb("create") },
                -- { key = "d",                cb = tree_cb("remove") },
                -- { key = "r",                cb = tree_cb("rename") },
                -- { key = "<C-r>",            cb = tree_cb("full_rename") },
                -- { key = "x",                cb = tree_cb("cut") },
                -- { key = "c",                cb = tree_cb("copy") },
                -- { key = "p",                cb = tree_cb("paste") },
                -- { key = "[c",               cb = tree_cb("prev_git_item") },
                -- { key = "]c",               cb = tree_cb("next_git_item") },
                -- { key = "-",                cb = tree_cb("dir_up") },
                -- { key = "q",                cb = tree_cb("close") },
            }
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    }
}