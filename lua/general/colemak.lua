local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }

    if opts then
      options = vim.tbl_extend("force", options, opts)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--> CURSOR MOVEMENT (alternatively 'ueni' instead of 'nemi')
map("n", "e", "k", {})   -- UP
map("n", "i", "j", {})   -- DOWN
map("n", "n", "h", {})   -- LEFT
map("n", "o", "l", {})   -- RIGHT

map("n", "E", "5k", {})  -- 5 UP
map("n", "I", "5j", {})  -- 5 DOWN
map("n", "N", "0", {})   -- START OF LINE
map("n", "O", "$", {})   -- END OF LINE

map("", "<C-e>", "<C-y>", {})   -- MOVE VIEW PORT 5 LINES UP WITHOUT CURSOR
map("", "<C-i>", "<C-e>", {})   -- MOVE VIEW PORT 5 LINES DOWN WITHOUT CURSOR

map("", "h", "e", {})   -- END OF WORD
map("", "W", "5w", {})  -- 5 WORDS FORWARD
map("", "B", "5b", {})  -- 5 WORDS BACKWARD

--> Remap o to m
map("", "m", "o", {})   -- INSERT MODE
map("", "M", "O", {})   -- INSERT (BEGIN OF LINE)

--> INSERT MODE
-- map("", "l", "i", {})   -- INSERT MODE
-- map("", "L", "I", {})   -- INSERT (BEGIN OF LINE)
map("", "l", "i", {})   -- INSERT MODE
map("", "L", "I", {})   -- INSERT (BEGIN OF LINE)

--> UNDO
-- map("", "l", "u", {})   -- UNDO

--> WINDOW MANAGEMENT
map("", "<nop>", "s", {})   -- UNBIND 's' KEY

map("", "se", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", {})   -- HORIZONTAL SPLIT UPWARD PLACEMENT
map("", "si", ":set splitbelow<CR>:split<CR>", {})   -- HORIZONTAL SPLIT DOWNWARD PLACEMENT
map("", "sn", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", {})   -- HORIZONTAL SPLIT LEFTWARD PLACEMENT
map("", "so", ":set splitright<CR>:vsplit<CR>", {})   -- HORIZONTAL SPLIT RIGHTWARD PLACEMENT

-- Move Between Panes
map("", "<c-e>", ":wincmd k<CR>", {})
map("", "<c-i>", ":wincmd j<CR>", {})
map("", "<c-n>", ":wincmd h<CR>", {})
map("", "<c-o>", ":wincmd l<CR>", {})

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