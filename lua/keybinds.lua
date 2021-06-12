local bind = vim.api.nvim_set_keymap

-- LEADER
bind('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- WINDOW NAVIGATION
bind('n', '<C-h>', '<C-w>h', {silent = true})
bind('n', '<C-j>', '<C-w>j', {silent = true})
bind('n', '<C-k>', '<C-w>k', {silent = true})
bind('n', '<C-l>', '<C-w>l', {silent = true})

-- WINDOW RESIZING
bind('n', '<C-Up>', ':resize -2<CR>', {silent = true})
bind('n', '<C-Down>', ':resize +2<CR>', {silent = true})
bind('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
bind('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

-- REDO
bind('n', '<S-z>', ':redo<CR>', {noremap = true, silent = true})

-- INDENTING
bind('v', '<', '<gv', {noremap = true, silent = true})
bind('v', '>', '>gv', {noremap = true, silent = true})

-- TABS
bind('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
bind('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
bind('n', '<S-x>', ':BufferClose<CR>', { noremap = true, silent = true })

-- MOVE LINES (VISUAL)
bind('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
bind('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- QUICKFIX TOGGLE
bind('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

-- EXPLORER
-- bind('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
bind('n', '<Leader>e', ":lua require'lir.float'.toggle()<CR>", {noremap = true, silent = true})
bind('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- TERMINAL
bind('n', '<Leader>t', ':ToggleTerm<CR>', {noremap = true, silent = true})

-- LAZYGIT
bind('n', '<Leader>g', ':lua_lazygit_toggle()<CR>', {noremap = true, silent = true})

-- UNDOTREE
bind('n', '<Leader>u', ':UndotreeToggle<CR>', {noremap = true, silent = true})

-- TELESCOPE
bind('n', '<Leader>f', ':Telescope find_files<CR>', {noremap = true, silent = true})

-- DASHBOARD
bind('n', '<Leader>;', ':Dashboard<CR>', {noremap = true, silent = true})

-- COMMENTS
bind('n', '<leader>/', ':CommentToggle<CR>', {noremap = true, silent = true})
bind('v', '<leader>/', ':CommentToggle<CR>', {noremap = true, silent = true})

-- CLOSE BUFFER
bind('n', "<leader>c", ':BufferClose<CR>', {noremap = true, silent = true})

-- PROJECTS
bind('n', '<leader>p', ":lua require'telescope'.extensions.project.project{}<CR>",
        {noremap = true, silent = true})

-- COMPE
bind("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
bind("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
bind("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
bind("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})