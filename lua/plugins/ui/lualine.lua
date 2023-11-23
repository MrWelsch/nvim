return {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-web-devicons', 
    lazy = false,
    priority = 1000,
    config = function()
        local status_ok, lualine = pcall(require, "lualine")
        if not status_ok then
            return
        end

        local status_ok, blame = pcall(require, "gitblame")
        if not status_ok then
            return
        end

        local catppuccin_oled = require'lualine.themes.catppuccin'
        catppuccin_oled.bg = '#000000'

        lualine.setup {
            options = {
                icons_enabled = true,
                theme = 'catppuccin',
                component_separators = '|',
                section_separators = { left = '', right = '' },
                -- section_separators = '',
                disabled_filetypes = {
                  statusline = {},
                  winbar = {},
                },
                -- ignore_focus = {},
                -- always_divide_middle = true,
                -- globalstatus = false,
                -- refresh = {
                --   statusline = 1000,
                --   tabline = 1000,
                --   winbar = 1000,
                -- }
              },
              sections = {
                lualine_a = {
                  { 'mode', separator = { left = '' }, right_padding = 2 },
                --   { 'mode', separator = { left = '' }, right_padding = 2 },
                },
                lualine_b = { 'filename', 'branch', { blame.get_current_blame_text, cond = blame.is_blame_text_available } },
                lualine_c = { 'fileformat' },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                  { 'location', separator = { right = '' }, left_padding = 2 },
                -- { 'location', separator = { right = '' }, left_padding = 2 },
                },
              },
              inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
              },
              tabline = {},
              winbar = {},
              inactive_winbar = {},
              extensions = { 'nvim-tree', 'lazy', 'mason', 'toggleterm' }
        }
    end
}