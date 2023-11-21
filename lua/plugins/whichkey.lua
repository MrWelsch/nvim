return { 
    'folke/which-key.nvim', 
    event = 'VeryLazy',
    config = function()
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
                border = require"general.misc".border, -- none, single, double, shadow TODO: Use this, to refactor other stuff into general files
                position = "bottom", -- bottom, top
                margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
                padding = {2, 2, 2, 2}, -- extra window padding [top, right, bottom, left]
                winblend = 0 -- value between 0-100 0 for fully opaque and 100 for fully transparent
            },
            layout = {
                height = {min = 4, max = 25}, -- min and max height of the columns
                width = {min = 20, max = 50}, -- min and max width of the columns
                spacing = 3 -- spacing between columns
            },
            hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
            show_help = false -- show help message on the command line when the popup is visible
        }

        --> OPTIONS APPLIED TO EACH MAPPING
        -- LEADER
        local leader_opts = {
            mode = "n", -- NORMAL mode
            prefix = "<leader>",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = false -- use `nowait` when creating keymaps
        }
        -- G
        local g_opts = {
            mode = "n", -- NORMAL mode
            prefix = "g",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = false -- use `nowait` when creating keymaps
        }

        --> SET MAPPINGS (Icons: https://www.nerdfonts.com/cheat-sheet)
        -- LEADER
        local leader_mappings = {
            -- STANDARD MAPPINGS
            [";"] =                                                                                                                 " DASHBOARD",
            ["/"] =                                                                                                                 " COMMENT",
            ["e"] =                                                                                                                 "פּ EXPLORER",
            ["h"] =                                                                                                                 "ײַ HORIZONTAL SPLIT",
            ["q"] =                                                                                                                 " QUIT",
            ["p"] =                                                                                                                 " PERFORMANCE",
            ["s"] =                                                                                                                 " SAVE",
            ["z"] =                                                                                                                 " REPLACE",
            ["x"] =                                                                                                                 " MAKE EXECUTABLE",
            ["t"] =                                                                                                                 " TERMINAL",
            ["v"] =                                                                                                                 "ﬠ VERTICAL SPLIT",
            ["r"] =                                                                                                                 " RENAME BUFFER",
            ["w"] =                                                                                                                 " CLOSE BUFFER",
            -- MENUS
            l = {
                name = "ﭧ LSP",
                d = {"<cmd>lua require('telescope.builtin').diagnostics(require('plugins.telescope').document)<cr>",                " DOCUMENT DIAGNOSTICS"},
                D = {"<cmd>lua require('telescope.builtin').diagnostics(require('plugins.telescope'))<cr>",                         " WORKSPACE DIAGNOSTICS"},
                f = {"<cmd>lua vim.lsp.buf.format({ async = false })<cr>",                                                          " FORMAT"},
                i = {"<cmd>LspInfo<cr>",                                                                                            " INFO"},
                m = {
                    name = " MARKDOWN",
                    c = {"<cmd>TexCompile<cr>",                                                                                     " COMPILE"},
                    l = {"<cmd>TexViewer<cr>",                                                                                      " LATEX PREVIEW"},
                    p = {"<cmd>Glow<cr>",                                                                                           " MARKDOWN PREVIEW"},
                },
            },
            f = {
                name = " FIND",
                f = {"<cmd>lua require('telescope.builtin').find_files(require('plugins.telescope'))<cr>",                          " FILE"},
                m = {"<cmd>lua require('telescope.builtin').marks(require('plugins.telescope'))<cr>",                               " MARKS"},
                M = {"<cmd>lua require('telescope.builtin').man_pages(require('plugins.telescope'))<cr>",                           " MAN PAGES"},
                p = {"<cmd>lua require('telescope.builtin').projects(require('plugins.telescope'))<cr>",                            " PROJECTS"},
                r = {"<cmd>lua require('telescope.builtin').oldfiles(require('plugins.telescope'))<cr>",                            " RECENT FILES"},
                R = {"<cmd>lua require('telescope.builtin').registers(require('plugins.telescope'))<cr>",                           " REGISTERS"},
                t = {"<cmd>lua require('telescope.builtin').live_grep(require('plugins.telescope'))<cr>",                           " TEXT"},
                d = {"<cmd>:TodoTelescope<cr>",                                                                                     " TODO"}
            },
            c = {
                name = "漣CONFIG",
                p = {"<cmd>Lazy profile<cr>",                                                                                       " PROFILE"},
                s = {"<cmd>Lazy sync<cr>",                                                                                          "痢 SYNC"},
                m = {"<cmd>Mason<cr>",                                                                                              "ﭧ MASON"},    
                t = {"<cmd>lua require('telescope.builtin').colorscheme(require('plugins.telescope'))<cr>",                         " THEME"},
            },
            g = {
                name = " GIT",
                -- BRANCHES ONLY WORK INSIDE GIT REP (Maybe catch exception?) 
                b = {"<cmd>lua require('telescope.builtin').git_branches(require('plugins.telescope'))<cr>",                        " BRANCHES"},
                l = {"<cmd>lua _lazygit_toggle()<cr>",                                                                               " LAZYGIT"},    
            },
        }
        -- G
        local g_mappings = {
            -- STANDARD MAPPINGS
            ["a"] =                                                                                                                 "Code Action",
            ["d"] =                                                                                                                 "Go to definition",
            ["t"] =                                                                                                                 "Go to type definition",
            ["D"] =                                                                                                                 "Go to declaration",
            ["r"] =                                                                                                                 "Show references",
            ["l"] =                                                                                                                 "Start line diagnostics",
            ["i"] =                                                                                                                 "Go to Implementation",
            ["h"] =                                                                                                                 "Hover",
            ["f"] =                                                                                                                 "Go to References | Implementation",
        }
        --> APPLY MAPPINGS AND OPTIONS
        local wk = require("which-key")
        wk.register(leader_mappings, leader_opts)
        wk.register(g_mappings, g_opts)
    end
}

