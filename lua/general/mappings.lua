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
map('n', '<leader>r', ':lua vim.lsp.buf.rename()<CR>')
-- map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
-- map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
-- map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
-- map('n', '<C-n>', ':lua vim.diagnostic.goto_next()<CR>')
-- map('n', '<C-z>', ':lua vim.diagnostic.goto_prev()<CR>')
map('n', 'gd', ':Lspsaga peek_definition<CR>')
map('n', 'gd', ':Lspsaga peek_type_definition<CR>')
map('n', 'gf', ':Lspsaga finder<CR>') -- references & implementation
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', 'gr', ':NiceReference<CR>')
map('n', 'gl', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
map('n', 'gh', ':Lspsaga hover_doc<CR>')
map('n', '<C-n>', ':Lspsaga diagnostic_jump_next<CR>')
map('n', '<C-z>', ':Lspsaga diagnostic_jump_prev<CR>')


--> INDENTING
map('v', '<', '<gv')
map('v', '>', '>gv')

--> MOVE LINES (VISUAL)
map('x', 'K', ':move \'<-2<CR>gv-gv')
map('x', 'J', ':move \'>+1<CR>gv-gv')

--> MAKE SCRIPT FILE EXECUTABLE
map('n', '<Leader>x', ':!chmod +x %<CR>', { silent = true })

--> REPLACE All OCCURENCES OF A WORD (VSCode Equivalent: Ctrl + Shift + L)
map('n', '<Leader>z', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

--> EXPLORER
map('n', '<Leader>e', ':NvimTreeToggle<CR>')
map('n', '<Leader>o', ':Lspsaga outline<CR>')

--> TERMINAL
map('n', '<Leader>t', ':Lspsaga term_toggle<CR>')

--> DASHBOARD
map('n', '<Leader>;', ':lua MiniStarter.open()<CR>')