local rose_pine_status_ok, rose_pine = pcall(require, "rose-pine")
if not rose_pine_status_ok then
	return
end

rose_pine.setup({
	disable_background = true,
	disable_float_background = true,
})

--> SET THEME-SPECIFIC COLORS
Color = {}

Color.background = nil
Color.staline = {
    i = "#c4a7e7",
	n = "#9ccfd8",
	c = "#31748f",
	v = "#f6c177",  
}

return Color