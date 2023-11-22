local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }

    if opts then
      options = vim.tbl_extend("force", options, opts)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("", "m", "h", {})   -- LEFT
map("", "n", "j", {})   -- UP
map("", "e", "k", {})   -- DOWN
map("", "i", "l", {})   -- RIGHT
map("", "j", "e", {})   -- END WORD
map("", "J", "E", {})   -- END WORD

map("", "k", "n", {})   -- FIND NEXT
map("", "K", "N", {})   -- FIND PREVIOUS
map("", "l", "i", {})   -- INSERT MODE
map("", "L", "I", {})   -- INSERT (BEGIN OF LINE)
map("", "N", "5j", {})  -- 5 UP
map("", "E", "5k", {})  -- 5 DOWN

map("", "H", "0", {})   -- BEGIN OF LINE
map("", "I", "$", {})   -- END OF LINE

-- -- NVIM-TREE (EXPLORER)
-- local function attach(bufnr)
--     local api = require("nvim-tree.api")
--     local function opts(desc)
--       return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--     end
  
--     api.config.mappings.default_on_attach(bufnr)
  
--     vim.keymap.set("n", "e", "", { buffer = bufnr })
--     vim.keymap.del("n", "e", { buffer = bufnr })
--     vim.keymap.set("n", "F", "", { buffer = bufnr })
--     vim.keymap.del("n", "F", { buffer = bufnr })
--     vim.keymap.set("n", "f", "", { buffer = bufnr })
--     vim.keymap.del("n", "f", { buffer = bufnr })
-- end
-- return attach

-- local cdh_map = vim.keymap.set

-- local function swap_map(lhs, rhs, mode)
--     map(mode or "", lhs, rhs, {})
--     map(mode or "", rhs, lhs, {})
-- end

--------------------------------------------------
--> Colemak
--------------------------------------------------
-- -- This swaps the maps defined in the colemak_maps table with each other.
-- local colemak_maps = {
-- { "n", "j" }, -- down
-- { "e", "k" }, -- up
-- { "s", "h" }, -- left
-- { "t", "l" }, -- right
-- }

-- -- Takes these key mappings and then swaps them for lowercase, uppercase, and <C-w><C- mappings, so you can navigate splits.
-- local mvmnt_prefix = "<C-w><C-"

-- for _, pairs in ipairs(colemak_maps) do
--     local lhs = pairs[1]
--     local rhs = pairs[2]

--     local mvmnt_lhs = table.concat({ mvmnt_prefix, lhs, ">" })
--     local mvmnt_rhs = table.concat({ mvmnt_prefix, rhs, ">" })

--     -- lowercase
--     swap_map(lhs, rhs)

--     -- uppercase
--     swap_map(string.upper(lhs), string.upper(rhs))

--     -- window movement
--     swap_map(mvmnt_lhs, mvmnt_rhs)
-- end

-- Sets up navigating visual lines as opposed to the real lines, for example in the case of wrapped text.
-- for _, mode in pairs({ "n", "v" }) do
--     map(mode, "e", "v:count == 0 ? 'gk' : 'k'", expr)
--     map(mode, "n", "v:count == 0 ? 'gj' : 'j'", expr)
-- end 