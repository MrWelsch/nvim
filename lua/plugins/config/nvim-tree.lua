local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.defer_fn(require('nvim-tree').refresh, 25)

vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_auto_close = O
vim.g.nvim_tree_auto_ignore_ft = 'dashboard'
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_quit_on_open = 0

vim.g.nvim_tree_bindings = {
["<CR>"]           = tree_cb("edit"),
["o"]              = tree_cb("edit"),
["l"]              = tree_cb("edit"),
["<2-LeftMouse>"]  = tree_cb("edit"),
["<2-RightMouse>"] = tree_cb("cd"),
["<C-]>"]          = tree_cb("cd"),
["v"]              = tree_cb("vsplit"),
["s"]              = tree_cb("split"),
["<C-t>"]          = tree_cb("tabnew"),
["<"]              = tree_cb("prev_sibling"),
[">"]              = tree_cb("next_sibling"),
["<BS>"]           = tree_cb("close_node"),
["h"]              = tree_cb("close_node"),
["<S-CR>"]         = tree_cb("close_node"),
["<Tab>"]          = tree_cb("preview"),
["I"]              = tree_cb("toggle_ignored"),
["H"]              = tree_cb("toggle_dotfiles"),
["R"]              = tree_cb("refresh"),
["a"]              = tree_cb("create"),
["d"]              = tree_cb("remove"),
["r"]              = tree_cb("rename"),
["<C-r>"]          = tree_cb("full_rename"),
["x"]              = tree_cb("cut"),
["c"]              = tree_cb("copy"),
["p"]              = tree_cb("paste"),
["[c"]             = tree_cb("prev_git_item"),
["]c"]             = tree_cb("next_git_item"),
["-"]              = tree_cb("dir_up"),
["q"]              = tree_cb("close"),
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
    folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
}

vim.g.nvim_tree_ignore = {
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
