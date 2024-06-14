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

local borders_dap = {
	{ "╒", "═", "╕", "│", "╛", "═", "╘", "│" },
    { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
	{ "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
}

-- DIAGNOSTIC SIGNS
local error = " "
local warn = " "
local hint = " "
local info = " "

-- DEBUG SIGNS
-- vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

--> SET
-- BORDERS (Default options: single, double,rounded, solid, shadow, none)
Misc.border = borders[3]
Misc.border_telescope = borders_telescope[3]
Misc.border_dap = borders_dap[3]

-- DIAGNOSTIC SIGNS
Misc.error = error
Misc.warn = warn
Misc.hint = hint
Misc.info = info

return Misc