return { 
    'kyazdani42/nvim-tree.lua', 
    dependencies = 'nvim-web-devicons', 
    cmd = {'NvimTreeToggle'},
    config = function()
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

        -- local tree_cb = require'nvim-tree.config'.nvim_tree_callback

        tree.setup {
            disable_netrw       = true,
            hijack_netrw        = true,
            open_on_tab         = false,
            hijack_cursor       = false,
            update_cwd          = true,
            diagnostics = {
                enable = true,
                icons = {
                hint = require"general.misc".hint,
                info = require"general.misc".info,
                warning = require"general.misc".warn,
                error = require"general.misc".error,
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
                -- height = 30,
                side = 'right',
                -- auto_resize = false,
                number = false,
                relativenumber = false,
                signcolumn = "yes"
            },
            trash = {
                cmd = "trash",
                require_confirm = true
            },
            -- on_attach = custom_mappings,
        }
    end
}