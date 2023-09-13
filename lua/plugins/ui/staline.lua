return {
    'tamton-aquib/staline.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        local status_ok, staline = pcall(require, "staline")
        if not status_ok then
            return
        end

        -- EVERFOREST
        local everforest = {
            i = "#7FBBB3",
            n = "#83C092",
            c = "#E69875",
            v = "#DBBC7F",
        }

        -- DRACULA PRO
        local draculapro = {
            i = "#9580ff",
            n = "#80ffea",
            c = "#8aff80",
            v = "#ff9580",  
        }

        -- GRUVBOX
        local gruvbox = {
            i = "#7daea3",
            n = "#a9b665",
            c = "#89b482",
            v = "#e78a4e",  
        }

        -- MONOKAI PRO
        local monokaipro = {
            i = "#ab9df2",
            n = "#7bd88f",
            c = "#5ad4e6",
            v = "#fc9867",  
        }

        -- NORD
        local nord = {
            i = "#B48EAD",
            n = "#88C0D0",
            c = "#A3BE8C",
            v = "#EBCB8B",  
        }

        -- ROSE-PINE
        local rosepine = {
            i = "#c4a7e7",
            n = "#9ccfd8",
            c = "#31748f",
            v = "#f6c177",  
        }

        -- TOKYODARK
        local tokyodark = {
            i = "#A485DD",
            n = "#7199EE",
            c = "#95C561",
            v = "#D7A65F",  
        }

        -- TOKYONIGHT
        local tokyonight = {
            i = "#bb9af7",
            n = "#7aa2f7",
            c = "#9ece6a",
            v = "#ff9e64",  
        }

        -- KANAGAWA
        local kanagawa = {
            i = "#7E9CD8",
            n = "#957FB8",
            c = "#76946A",
            v = "#FFA066",  
        }

        staline.setup {
            sections = {
                left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
                mid = {'file_name'},
                right = {'line_column' }
            },
            inactive_sections = {
                left = {},
                mid = {'file_name'},
                right = {}
            },
            mode_colors = rosepine, -- TODO: REFACTOR THIS SO THAT IT IS SET WITH COLOSCHEME
            defaults = {
                true_colors = true,
                line_column = " [%l/%L] :%c  ",
                branch_symbol = " ",
                bg = 'none',
                -- Needed to see buffer descriptions in dapui
                inactive_color  = "#f2e5bc",
            },
            mode_icons = {
                n = " ",
                i = " ",
                c = " ",
                v = " "
            },
            lsp_symbols = {
                Error= require"general.misc".error,
                Info= require"general.misc".info,
                Warn= require"general.misc".warn,
                Hint= require"general.misc".hint,
            },
        }
    end
}