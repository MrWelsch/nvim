local opts = {noremap=true, silent=true}
local function map(mode, key, mapping) vim.api.nvim_set_keymap(mode, key, mapping, opts) end

--> LEADER
map('n', '<Space>', '<NOP>')
vim.g.mapleader = ' '

--> WINDOW NAVIGATION
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

--> WINDOW RESIZING
map('n', '<M-Up>', ':resize -2<CR>')
map('n', '<M-Down>', ':resize +2<CR>')
map('n', '<M-Left>', ':vertical resize -2<CR>')
map('n', '<M-Right>', ':vertical resize +2<CR>')

-- REDO
map('n', '<S-z>', ':redo<CR>')

-- LSP
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
-- map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
map('n', 'gr', ':lua require("nice-reference").references()<CR>')
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
map('n', 'gh', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<C-n>', ':lua vim.diagnostic.goto_next()<CR>')
map('n', '<C-z>', ':lua vim.diagnostic.goto_prev()<CR>')

--> INDENTING
map('v', '<', '<gv')
map('v', '>', '>gv')

--> BUFFER
map('n', '<TAB>', ':BufferLineCycleNext<CR>')
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>')
map('n', "<leader>w", ':bd<CR>')                                    -- close buffer

--> MOVE LINES (VISUAL)
map('x', 'K', ':move \'<-2<CR>gv-gv')
map('x', 'J', ':move \'>+1<CR>gv-gv')

--> QUICKFIX TOGGLE
map('', '<C-q>', ':call QuickFixToggle()<CR>')

--> EXPLORER
map('n', '<Leader>e', ':NvimTreeToggle<CR>')
--map('n', '<Leader>e', ":lua require'lir.float'.toggle()<CR>")
map('n', '-', ':RnvimrToggle<CR>')

--> TERMINAL
map('n', '<Leader>t', ':ToggleTerm<CR>')

--> DASHBOARD
map('n', '<Leader>;', ':Alpha<CR>')

--> COMMENTS
map("n", "<Leader>/", "<Plug>kommentary_line_default")
map("v", "<Leader>/", "<Plug>kommentary_visual_default")

