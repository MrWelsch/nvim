vim.cmd('colorscheme ' .. O.colorscheme)

-- DRACULA PRO
vim.cmd('packadd! dracula_pro')
vim.cmd('syntax enable')
vim.cmd('let g:dracula_colorterm = 0')

-- COMMENTS
-- vim.cmd('hi! Comment gui=italic')

-- DISABLE COLOR SCHEME BACKGROUND COLORS (TRANSLUCENT)
-- highlight Normal ctermbg=none guibg=none
-- highlight SignColumn ctermbg=none guibg=none
-- highlight LineNr ctermbg=none guibg=none
vim.cmd('hi! EndOfBuffer guifg=bg guibg=bg ctermfg=bg ctermbg=bg')

-- DASHBOARD COLORS
vim.cmd('hi! default link DashboardHeader Number')
vim.cmd('highlight default link DashboardCenter Operator')
vim.cmd('highlight default link DashboardShortcut Identifier')
vim.cmd('highlight default link DashboardFooter Function')
