local tree = require'nvim-tree'
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
        enable = false,
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
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'right',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
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

-- vim.g.nvim_tree_bindings = {
-- ["<CR>"]           = tree_cb("edit"),
-- ["o"]              = tree_cb("edit"),
-- ["l"]              = tree_cb("edit"),
-- ["<2-LeftMouse>"]  = tree_cb("edit"),
-- ["<2-RightMouse>"] = tree_cb("cd"),
-- ["<C-]>"]          = tree_cb("cd"),
-- ["v"]              = tree_cb("vsplit"),
-- ["s"]              = tree_cb("split"),
-- ["<C-t>"]          = tree_cb("tabnew"),
-- ["<"]              = tree_cb("prev_sibling"),
-- [">"]              = tree_cb("next_sibling"),
-- ["<BS>"]           = tree_cb("close_node"),
-- ["h"]              = tree_cb("close_node"),
-- ["<S-CR>"]         = tree_cb("close_node"),
-- ["<Tab>"]          = tree_cb("preview"),
-- ["I"]              = tree_cb("toggle_ignored"),
-- ["H"]              = tree_cb("toggle_dotfiles"),
-- ["R"]              = tree_cb("refresh"),
-- ["a"]              = tree_cb("create"),
-- ["d"]              = tree_cb("remove"),
-- ["r"]              = tree_cb("rename"),
-- ["<C-r>"]          = tree_cb("full_rename"),
-- ["x"]              = tree_cb("cut"),
-- ["c"]              = tree_cb("copy"),
-- ["p"]              = tree_cb("paste"),
-- ["[c"]             = tree_cb("prev_git_item"),
-- ["]c"]             = tree_cb("next_git_item"),
-- ["-"]              = tree_cb("dir_up"),
-- ["q"]              = tree_cb("close"),
-- }

-- vim.g.nvim_tree_icons = {
--     default = '',
--     symlink = '',
--     git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
--     folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
-- }
