Misc = {}

--> DIAGNOSTIC GUTTER SIGNS
local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

--> BORDERS
-- DEFINE BORDER ARRAYS
local borders = {
	{ "╒", "═", "╕", "│", "╛", "═", "╘", "│" },
    { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" },
	{ "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
}

local borders_telescope = {
	{ "═", "│", "═", "│", "╒", "╕", "╛", "╘" },
    { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
	{ "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
}

-- SET BORDERS TO ARRAY ENTRY
Misc.border = borders[3]
Misc.border_telescope = borders_telescope[3]

return Misc