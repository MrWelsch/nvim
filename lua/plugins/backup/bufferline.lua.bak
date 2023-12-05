return { 
    'akinsho/nvim-bufferline.lua', 
    dependencies = { 'kyazdani42/nvim-web-devicons', 'catppuccin/nvim' },
    event = 'BufRead',
    config = function()
        local status_ok, bufferline = pcall(require, "bufferline")
        if not status_ok then
            return
        end

        -- CHANGE HIGHLIGHTING IF NORD THEME IS SET
        -- TODO: if clause not yet working / not triggered
        -- if(vim.g.colors_name == 'nord') then
        --     local highlights = require("nord").bufferline.highlights({
        --         italic = true,
        --         bold = true,
        --     })
        -- end

        bufferline.setup{
            options = {
                numbers = 'none',
                indicator = {
                    icon = '▎',
                    style = 'icon',
                },
                style_preset = {
                    bufferline.style_preset.minimal,
                },
                -- indicator_icon = '▎',
                buffer_close_icon = '',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                max_name_length = 25,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                tab_size = 30,
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local error = require"general.misc".error
                    local warn = require"general.misc".warn
                    local icon = level:match("error") and error or warn
                        if context.buffer:current() then
                            return ''
                        end
                    
                        return " " .. icon .. count 
                end,
                offsets = {
                    {
                        filetype = 'NvimTree',
                        text = 'File Explorer',
                        text_align = 'center',
                    },
                    {
                        filetype = 'Outline',
                        text = 'Symbols',
                        text_align = 'center',
                    },
                    {
                        filetype = 'packer',
                        text = 'Plugins manager',
                        text_align = 'center',
                    },
                },
                show_buffer_icons = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
                show_tab_indicators = true,
                persist_buffer_sort = true,
                separator_style = 'thin',
                enforce_regular_tabs = true,
                always_show_bufferline = false,
                sort_by = 'directory',
                
            },
            highlights = require("catppuccin.groups.integrations.bufferline").get(),
        }
    end
}