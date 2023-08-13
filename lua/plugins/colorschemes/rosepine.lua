return {
    'rose-pine/neovim',
    lazy = true,
    config = function()
        local rose_pine_status_ok, rose_pine = pcall(require, "rose-pine")
        if not rose_pine_status_ok then
            return
        end

        rose_pine.setup({
            disable_background = true,
            disable_float_background = true,
        })
    end
}