-- DRACULA PRO

local cmd = vim.cmd

vim.g.dracula_colorterm = 0
cmd('colorscheme dracula_pro_van_helsing')

-- DISABLE COLOR SCHEME BACKGROUND COLORS (TRANSLUCENT)
--highlight Normal ctermbg=none guibg=none
--highlight SignColumn ctermbg=none guibg=none
--highlight LineNr ctermbg=none guibg=none

-- DASHBOARD COLORS
cmd('hi! default link DashboardHeader Number')
cmd('hi! default link DashboardCenter Operator')
cmd('hi! default link DashboardShortcut Identifier')
cmd('hi! default link DashboardFooter Function')

--vim.cmd('hi! default link EndOfBuffer guifg=bg guibg=bg ctermfg=bg ctermbg=bg')