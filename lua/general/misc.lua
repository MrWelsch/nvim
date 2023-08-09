Misc = {}

--> CONFIGURE
-- BORDERS 
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

-- DIAGNOSTIC SIGNS
local error = " "
local warn = " "
local hint = " "
local info = " "

--> SET
-- BORDERS (Default options: single, double,rounded, solid, shadow, none)
Misc.border = borders[3]
Misc.border_telescope = borders_telescope[3]

-- DIAGNOSTIC SIGNS
Misc.error = error
Misc.warn = warn
Misc.hint = hint
Misc.info = info

return Misc