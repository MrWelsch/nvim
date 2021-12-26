local opts = {noremap=true, silent=true}
local function map(mode, key, mapping) vim.api.nvim_set_keymap(mode, key, mapping, opts) end

--> LEADER
map('n', '<Space>', '<NOP>')
vim.g.mapleader = ' '

--> WINDOW NAVIGATION
map('n', '<C-h>', '<C-w>h') -- focus left window
map('n', '<C-j>', '<C-w>j') -- focus bot window
map('n', '<C-k>', '<C-w>k') -- focus top window
map('n', '<C-l>', '<C-w>l') -- focus right window

--> WINDOW RESIZING
map('n', '<M-Up>', ':resize -2<CR>')
map('n', '<M-Down>', ':resize +2<CR>')
map('n', '<M-Left>', ':vertical resize -2<CR>')
map('n', '<M-Right>', ':vertical resize +2<CR>')

--> BUFFER
map('n', '<TAB>', ':BufferLineCycleNext<CR>') -- focus next tab
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>') -- focus prev tab
map('n', "<leader>w", ':bd<CR>') -- close buffer
map('n', "<leader>s", ':w<CR>') -- save buffer
map('n', "<leader>q", ':q<CR>') -- quit buffer/split
map('n', '<leader>v', ':vs<CR>') -- vertical split
map('n', '<leader>h', ':hs<CR>') -- horizontal split

-- LSP
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', 'gr', ':NiceReference<CR>')
map('n', 'gl', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
map('n', 'gh', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<C-n>', ':lua vim.diagnostic.goto_next()<CR>')
map('n', '<C-z>', ':lua vim.diagnostic.goto_prev()<CR>')

--> INDENTING
map('v', '<', '<gv')
map('v', '>', '>gv')

--> MOVE LINES (VISUAL)
map('x', 'K', ':move \'<-2<CR>gv-gv')
map('x', 'J', ':move \'>+1<CR>gv-gv')

--> EXPLORER
map('n', '<Leader>e', ':NvimTreeToggle<CR>')

--> TERMINAL
map('n', '<Leader>t', ':ToggleTerm<CR>')

--> DASHBOARD
map('n', '<Leader>;', ':Alpha<CR>')

