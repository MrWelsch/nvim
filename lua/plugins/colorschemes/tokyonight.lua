return {
    'folke/tokyonight.nvim',
    -- lazy = false,
    -- priority = 1000,
    config = function()
        local status_ok, tokyonight = pcall(require, "tokyonight")
        if not status_ok then
            return
        end

        tokyonight.setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day", -- The theme is used when the background is set to light
            transparent = false, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
            styles = {
              -- Style to be applied to different syntax groups
              -- Value is any valid attr-list value for `:help nvim_set_hl`
              comments = { italic = true },
              keywords = { italic = true },
              functions = {},
              variables = {},
              -- Background styles. Can be "dark", "transparent" or "normal"
              sidebars = "transparent", -- style for sidebars, see below
              floats = "transparent", -- style for floating windows
            },
            sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false, -- dims inactive windows
            lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
          
            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            ---@param colors ColorScheme
            on_colors = function(colors)
                -- colors.hint = colors.orange
                -- colors.error = "#ff0000"
            end,
          
            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---@param highlights Highlights
            ---@param colors ColorScheme
            on_highlights = function(hl, c)
                -- Borderless Telescope Example
                local prompt = "#2d3149"
                hl.TelescopeNormal = {
                  bg = c.bg_dark,
                  fg = c.fg_dark,
                }
                hl.TelescopeBorder = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,
                }
                hl.TelescopePromptNormal = {
                  bg = prompt,
                }
                hl.TelescopePromptBorder = {
                  bg = prompt,
                  fg = prompt,
                }
                hl.TelescopePromptTitle = {
                  bg = prompt,
                  fg = prompt,
                }
                hl.TelescopePreviewTitle = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,
                }
                hl.TelescopeResultsTitle = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,
                }
              end,
          })

        -- To have undercurls show up and in color, add the following to your Tmux configuration file:
        -- # Undercurl
        -- set -g default-terminal "${TERM}"
        -- set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
        -- set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
    
        -- You can easily use the color palette for other plugins inside your Neovim configuration:
        -- local colors = require("tokyonight.colors").setup() -- pass in any of the config options as explained above
        -- local util = require("tokyonight.util")

        -- aplugin.background = colors.bg_dark
        -- aplugin.my_error = util.lighten(colors.red1, 0.3) -- number between 0 and 1. 0 results in white, 1 results in red1
    end
}