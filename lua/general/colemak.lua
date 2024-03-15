local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }

    if opts then
      options = vim.tbl_extend("force", options, opts)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--> CURSOR MOVEMENT (alternatively 'ueni' instead of 'nemi')
map("n", "n", "k", {})   -- UP
map("n", "e", "j", {})   -- DOWN
map("n", "m", "h", {})   -- LEFT
map("n", "i", "l", {})   -- RIGHT

map("n", "N", "5k", {})  -- 5 UP
map("n", "E", "5j", {})  -- 5 DOWN
map("n", "M", "0", {})   -- START OF LINE
map("n", "I", "$", {})   -- END OF LINE

map("", "<C-n>", "<C-y>", {})   -- MOVE VIEW PORT 5 LINES UP WITHOUT CURSOR
map("", "<C-e>", "<C-e>", {})   -- MOVE VIEW PORT 5 LINES DOWN WITHOUT CURSOR

map("", "h", "e", {})   -- END OF WORD
map("", "W", "5w", {})  -- 5 WORDS FORWARD
map("", "B", "5b", {})  -- 5 WORDS BACKWARD

--> INSERT MODE
-- map("", "l", "i", {})   -- INSERT MODE
-- map("", "L", "I", {})   -- INSERT (BEGIN OF LINE)
map("", "l", "i", {})   -- INSERT MODE
map("", "L", "I", {})   -- INSERT (BEGIN OF LINE)

--> UNDO
-- map("", "l", "u", {})   -- UNDO

--> WINDOW MANAGEMENT
map("", "<nop>", "s", {})   -- UNBIND 's' KEY

map("", "sn", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", {})   -- HORIZONTAL SPLIT UPWARD PLACEMENT
map("", "se", ":set splitbelow<CR>:split<CR>", {})   -- HORIZONTAL SPLIT DOWNWARD PLACEMENT
map("", "sm", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", {})   -- HORIZONTAL SPLIT LEFTWARD PLACEMENT
map("", "si", ":set splitright<CR>:vsplit<CR>", {})   -- HORIZONTAL SPLIT RIGHTWARD PLACEMENT

-- Resize Splits With Arrow Keys
map("", "<up>", ":res +5<CR>", {})
map("", "<down>", ":res -5<CR>", {})
map("", "<left>", ":vertical resize-5<CR>", {})
map("", "<right>", ":vertical resize+5<CR>", {})

-- Move Windows
map("", "sh", "<C-w>t<C-w>K", {})   -- PLACE TWO SPLITS HORIZONTALLY
map("", "sv", "<C-w>t<C-w>H", {})   -- PLACE TWO SPLITS VERTICALLY
map("", "srh", "<C-w>b<C-w>K", {})  -- ROTATE & PLACE TWO SPLITS HORIZONTALLY
map("", "srv", "<C-w>b<C-w>H", {})  -- ROTATE & PLACE TWO SPLITS VERTICALLY

-- Move Cursor Between Windows
-- map("", "<LEADER>w", "<C-w>w", {})   -- MOVE CURSOR UP WINDOW
-- map("", "<LEADER>n", "<C-w>k", {})   -- MOVE CURSOR UP WINDOW
-- map("", "<LEADER>e", "<C-w>j", {})   -- MOVE CURSOR DOWN WINDOW
-- map("", "<LEADER>m", "<C-w>h", {})   -- MOVE CURSOR LEFT WINDOW
-- map("", "<LEADER>i", "<C-w>l", {})   -- MOVE CURSOR RIGHT WINDOW

--> SEARCHING
map("", "k", "n", {})   -- FIND NEXT
map("", "K", "N", {})   -- FIND PREVIOUS