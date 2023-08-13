return{
    'maxmx03/dracula.nvim',
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        local dracula_status_ok, dracula = pcall(require, "dracula")
        if not dracula_status_ok then
            return
        end

        local draculapro_status_ok, draculapro = pcall(require, "draculapro")
        if not draculapro_status_ok then
            return
        end

        -- function custom(c)
        --     return {
        --         -- STYLE
        --         ['@type'] = { italic = true, bold = false },
        --         ['@function'] = { italic = false, bold = false },
        --         ['@comment'] = { italic = true },
        --         ['@keyword'] = { italic = false },
        --         ['@constant'] = { italic = false, bold = false },
        --         ['@variable'] = { italic = true },
        --         ['@field'] = { italic = true },
        --         ['@parameter'] = { italic = true },
        --         -- TELESCOPE
        --         TelescopeResultsBorder = { fg = c.bgdark, bg = c.bgdark },
        --         TelescopeResultsNormal = { bg = c.bgdark },
        --         TelescopePreviewNormal = { bg = c.bg },
        --         TelescopePromptBorder = { fg = c.bgdark, bg = c.bgdark },
        --         TelescopeTitle = { fg = c.fg, bg = c.comment },
        --         TelescopePromptPrefix = { fg = c.purple },
        --         -- CMP
        --         CmpItemKindText = { reverse = true },
        --         CmpItemKindMethod = { reverse = true },
        --         CmpItemKindFunction = { reverse = true },
        --         CmpItemKindConstructor = { reverse = true },
        --         CmpItemKindField = { reverse = true },
        --         CmpItemKindVariable = { reverse = true },
        --         CmpItemKindClass = { reverse = true },
        --         CmpItemKindInterface = { reverse = true },
        --         CmpItemKindModule = { reverse = true },
        --         CmpItemKindProperty = { reverse = true },
        --         CmpItemKindUnit = { reverse = true },
        --         CmpItemKindValue = { reverse = true },
        --         CmpItemKindEnum = { reverse = true },
        --         CmpItemKindKeyword = { reverse = true },
        --         CmpItemKindSnippet = { reverse = true },
        --         CmpItemKindColor = { reverse = true },
        --         CmpItemKindFile = { reverse = true },
        --         CmpItemKindReference = { reverse = true },
        --         CmpItemKindFolder = { reverse = true },
        --         CmpItemKindEnumMember = { reverse = true },
        --         CmpItemKindConstant = { reverse = true },
        --         CmpItemKindStruct = { reverse = true },
        --         CmpItemKindEvent = { reverse = true },
        --         CmpItemKindOperator = { reverse = true },
        --         CmpItemKindTypeParameter = { reverse = true },
        --         CmpItemKindBorder = { fg = c.bgdark, bg = c.bgdark },
        --     }
        -- end
  
        draculapro.setup({
            theme = 'van_helsing'
        })
  
        dracula.setup {
            dracula_pro = draculapro,
            colors = draculapro.colors,
            -- colors = {
            --     bg = '#color',
            --     bgdark = '#color',
            -- }
            -- soft = false,
            transparent = true,
            -- saturation = { enabled = false, amount = 10 }
            -- enabled = false,
            -- amount = 10,
            -- override = custom,
        }
        
        vim.cmd.colorscheme 'dracula'
      end,
    dependencies = {
    'MrWelsch/draculapro',
    },

}