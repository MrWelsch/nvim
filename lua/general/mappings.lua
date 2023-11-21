local opts = {noremap=true, silent=true}

local function map(mode, key, mapping) 
    vim.api.nvim_set_keymap(mode, key, mapping, opts) 
end

-- local cdh_map = vim.keymap.set

local function swap_map(lhs, rhs, mode)
    map(mode or "", lhs, rhs, {})
    map(mode or "", rhs, lhs, {})
end

--> LEADER
map('n', '<Space>', '<NOP>')
vim.g.mapleader = ' '

--> WINDOW NAVIGATION
map('n', '<C-h>',       '<C-w>h') -- focus left window
map('n', '<C-j>',       '<C-w>j') -- focus bot window
map('n', '<C-k>',       '<C-w>k') -- focus top window
map('n', '<C-l>',       '<C-w>l') -- focus right window

--> WINDOW RESIZING
map('n', '<M-Up>',      ':resize -2<CR>')
map('n', '<M-Down>',    ':resize +2<CR>')
map('n', '<M-Left>',    ':vertical resize -2<CR>')
map('n', '<M-Right>',   ':vertical resize +2<CR>')

--> BUFFER
map('n', '<TAB>',       ':BufferLineCycleNext<CR>') -- focus next tab
map('n', '<S-TAB>',     ':BufferLineCyclePrev<CR>') -- focus prev tab
map('n', "<leader>w",   ':bd<CR>') -- close buffer
map('n', "<leader>s",   ':w<CR>') -- save buffer
map('n', "<leader>q",   ':q<CR>') -- quit buffer/split
map('n', '<leader>v',   ':vs<CR>') -- vertical split
map('n', '<leader>h',   ':hs<CR>') -- horizontal split

-- LSP
map('n', '<leader>r',   ':lua vim.lsp.buf.rename()<CR>')
--
map('n', 'ga',          ':lua vim.lsp.buf.code_action()<CR>')
map('n', 'gd',          ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gt',          ':lua vim.lsp.buf.type_definition()<CR>')
map('n', 'gD',          ':lua vim.lsp.buf.declaration()<CR>')
map('n', 'gr',          ':lua vim.lsp.buf.references()<CR>')
map('n', 'gl',          ':lua vim.diagnostic.open_float()<CR>')
map('n', 'gi',          ':lua vim.lsp.buf.implementation()<CR>')
map('n', 'gh',          ':lua vim.lsp.buf.hover()<CR>')
map('n', '<C-n>',       ':lua vim.diagnostic.goto_next()<CR>')
map('n', '<C-z>',       ':lua vim.diagnostic.goto_prev()<CR>')

--> INDENTING
map('v', '<',           '<gv')
map('v', '>',           '>gv')

--> MOVE LINES (VISUAL)
map('x', 'K',           ':move \'<-2<CR>gv-gv')
map('x', 'J',           ':move \'>+1<CR>gv-gv')

--> MAKE SCRIPT FILE EXECUTABLE
map('n', '<Leader>x',   ':!chmod +x %<CR>', { silent = true })

--> REPLACE All OCCURENCES OF A WORD (VSCode Equivalent: Ctrl + Shift + L)
map('n', '<Leader>z',   ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

--> EXPLORER
map('n', '<Leader>e',   ':NvimTreeToggle<CR>')
-- Get to paren dir by using '-'.
-- map('n', '<Leader>e', ':Oil --float<CR>')

--> TERMINAL
map('n', '<Leader>t',   ':ToggleTerm<CR>')

--> DASHBOARD
map('n', '<Leader>;',   ':lua MiniStarter.open()<CR>')

--> VTOP
map('n', '<Leader>p',   ':lua _vtop_toggle()<CR>')
 
--------------------------------------------------
--> Colemak
--------------------------------------------------
-- This swaps the maps defined in the colemak_maps table with each other.
local colemak_maps = {
{ "n", "j" }, -- down
{ "e", "k" }, -- up
{ "s", "h" }, -- left
{ "t", "l" }, -- right
}

-- Takes these key mappings and then swaps them for lowercase, uppercase, and <C-w><C- mappings, so you can navigate splits.
local mvmnt_prefix = "<C-w><C-"

for _, pairs in ipairs(colemak_maps) do
    local lhs = pairs[1]
    local rhs = pairs[2]

    local mvmnt_lhs = table.concat({ mvmnt_prefix, lhs, ">" })
    local mvmnt_rhs = table.concat({ mvmnt_prefix, rhs, ">" })

    -- lowercase
    swap_map(lhs, rhs)

    -- uppercase
    swap_map(string.upper(lhs), string.upper(rhs))

    -- window movement
    swap_map(mvmnt_lhs, mvmnt_rhs)
end

-- Sets up navigating visual lines as opposed to the real lines, for example in the case of wrapped text.
-- for _, mode in pairs({ "n", "v" }) do
--     map(mode, "e", "v:count == 0 ? 'gk' : 'k'", expr)
--     map(mode, "n", "v:count == 0 ? 'gj' : 'j'", expr)
-- end 