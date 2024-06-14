return {
    'eddyekofo94/gruvbox-flat.nvim', 
    lazy = true,
    config = function()
        local cmd = vim.cmd
        
        vim.g.gruvbox_italic_functions = false
        -- Set a darker background on sidebar-like windows. For example: ["qf", "vista_kind", "terminal", "packer"]
        -- vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }
        -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead.
        -- Should work with the standard StatusLine and LuaLine.
        vim.g.gruvbox_hide_inactive_statusline = false
        vim.g.gruvbox_transparent = false
        -- Sidebar like windows like NvimTree get a darker background
        vim.g.gruvbox_dark_sidebar = false
        -- Float windows like the lsp diagnostics windows get a darker background.
        vim.g.gruvbox_dark_float = false
        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

        -- Set before CUSTOM HIGHLIGHTS
        cmd("colorscheme "..('gruvbox-flat'))

        --> CUSTOM HIGHLIGHTS TODO: WHY ARE THESE NOT SET?
        -- COLORS
        local transparent = 'NONE'
        local background = '#32302f'
        local border = '#f2e5bc'
        local green = '#a9b665'
        local blue = '#7daea3'
        local cyan = '#89b482'
        local red = '#ea6962'

        -- HIGHLIGHTS
        -- Transparent
        cmd("hi TelescopePromptNormal guibg="..(transparent))
        cmd("hi TelescopePromptBorder guibg="..(transparent))
        cmd("hi TelescopePromptPrefix guibg="..(transparent))
        cmd("hi BufferLineFill guibg="..(transparent))
        cmd("hi NvimTreeNormal guibg="..(transparent))
        cmd("hi NormalFloat guibg="..(transparent))
        cmd("hi WhichKeyFloat guibg="..(transparent))
        -- Background
        cmd("hi StatusLine guibg="..(background))
        cmd("hi StatusLineNC guibg="..(background))
        cmd("hi Staline guibg="..(background))
        -- Border
        cmd("hi TelescopePromptBorder guifg="..(border))
        cmd("hi TelescopePreviewBorder guifg="..(border))
        cmd("hi TelescopeResultsBorder guifg="..(border))
        cmd("hi LspInfoBorder guifg="..(border))
        cmd("hi DapUIFloatBorder guifg="..(border))
        -- Green
        cmd("hi DapUIPlayPause guifg="..(green))
        cmd("hi DapUIPlayPauseNC guifg="..(green))
        -- Blue
        cmd("hi DapUIRestart guifg="..(blue))
        cmd("hi DapUIRestartNC guifg="..(blue))
        -- Cyan      
        cmd("hi DapUIStepOver guifg="..(cyan))
        cmd("hi DapUIStepOverNC guifg="..(cyan))
        cmd("hi DapUIStepInto guifg="..(cyan))
        cmd("hi DapUIStepIntoNC guifg="..(cyan))
        cmd("hi DapUIStepBack guifg="..(cyan))
        cmd("hi DapUIStepBackNC guifg="..(cyan))
        cmd("hi DapUIStepOut guifg="..(cyan))
        cmd("hi DapUIStepOutNC guifg="..(cyan))
        -- Red
        cmd("hi DapUIStop guifg="..(red))
        cmd("hi DapUIStopNC guifg="..(red))
    end
}

