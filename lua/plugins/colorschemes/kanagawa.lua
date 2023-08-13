return {
    'rebelot/kanagawa.nvim',
    lazy = true,
    config = function()
        local status_ok, kanagawa = pcall(require, "kanagawa")
        if not status_ok then
            return
        end

        kanagawa.setup {
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = true,         -- do not set background color
            dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            colors = {                   -- add/modify highlights
                palette = {
                    -- change all usages of these colors
                    -- sumiInk0 = "#000000",
                    -- fujiWhite = "#FFFFFF",
                },
                theme = {
                    -- change specific usages for a certain theme, or for all of them
                    -- wave = {
                    --     ui = {
                    --         float = {
                    --             bg = "none",
                    --         },
                    --     },
                    -- },
                    -- dragon = {
                    --     syn = {
                    --         parameter = "yellow",
                    --     },
                    -- },
                    all = {
                        ui = {
                            bg_gutter = "none" -- Remove gutter background
                        }
                    }
                }
            },
            overrides = function(colors) -- add/modify highlights
                local theme = colors.theme
                return {
                    --> TRANSPARENT FLOATING WINDOWS
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },

                    -- Save an hlgroup with dark background and dimmed foreground
                    -- so that you can use it where your still want darker windows.
                    -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                    -- Popular plugins that open floats will link to NormalFloat by default;
                    -- set their background accordingly if you wish to keep them dark and borderless
                    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                    --> BORDERLESS TELESCOPE
                    -- TelescopeTitle = { fg = theme.ui.special, bold = true },
                    -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                    -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

                    --> DARK COMPLETION (POPUP) MENU
                    -- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
                    -- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                    -- PmenuSbar = { bg = theme.ui.bg_m1 },
                    -- PmenuThumb = { bg = theme.ui.bg_p2 },
                }
            end,
            theme = "wave",              -- Load "wave" theme when 'background' option is not set
            background = {               -- map the value of 'background' option to a theme
                dark = "wave",           -- try "dragon" !
                light = "lotus"
            },
        }

        --> Terminal Integration
        -- The following example provides a snippet to automatically 
        -- change the theme for the Kitty terminal emulator
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "kanagawa",
            callback = function()
                if vim.o.background == "light" then
                    vim.fn.system("kitty +kitten themes Kanagawa_light")
                elseif vim.o.background == "dark" then
                    vim.fn.system("kitty +kitten themes Kanagawa_dragon")
                else
                    vim.fn.system("kitty +kitten themes Kanagawa")
                end
            end,
        })
    end
}

-- --> Get palette and theme colors
-- -- Get the colors for the current theme
-- local colors = require("kanagawa.colors").setup()
-- local palette_colors = colors.palette
-- local theme_colors = colors.theme

-- -- Get the colors for a specific theme
-- local wave_colors = require("kanagawa.colors").setup({ theme = 'wave' })