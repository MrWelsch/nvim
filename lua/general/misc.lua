Misc = {}

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

local borders_result = {
    { "═", " ", " ", " ", "╘", "╛", " ", " " },
    { "═", " ", " ", " ", "╚", "╝", " ", " " },
    { "─", " ", " ", " ", "╰", "╯", " ", " " },
}

-- SET BORDERS TO ARRAY ENTRY
Misc.border = borders[3]
Misc.border_telescope = borders_telescope[3]
Misc.border_result = borders_result[3]

return Misc