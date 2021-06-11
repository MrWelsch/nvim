-- DRACULA PRO
vim.cmd('packadd! dracula_pro')
vim.cmd('syntax enable')
vim.g.dracula_colorterm = 0
vim.cmd('colorscheme dracula_pro_van_helsing')
-- COMMENTS
-- vim.cmd('hi! Comment gui=italic')

-- DISABLE COLOR SCHEME BACKGROUND COLORS (TRANSLUCENT)
-- highlight Normal ctermbg=none guibg=none
-- highlight SignColumn ctermbg=none guibg=none
-- highlight LineNr ctermbg=none guibg=none
--vim.cmd('hi! default link EndOfBuffer guifg=bg guibg=bg ctermfg=bg ctermbg=bg')
-- DASHBOARD COLORS
vim.cmd('hi! default link DashboardHeader Number')
vim.cmd('hi! default link DashboardCenter Operator')
vim.cmd('hi! default link DashboardShortcut Identifier')
vim.cmd('hi! default link DashboardFooter Function')
