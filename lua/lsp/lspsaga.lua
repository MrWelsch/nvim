local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	return
end

lspsaga.setup({
    ui = {
        border = require"general.misc".border,
        code_action = '',
    },
    outline = {
        detail = false,
        auto_preview = false,
    }
})