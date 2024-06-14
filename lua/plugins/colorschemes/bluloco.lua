return {
    'uloco/bluloco.nvim',
    lazy = true,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
        local bluloco_status_ok, bluloco = pcall(require, "bluloco")
        if not bluloco_status_ok then
            return
        end

        bluloco.setup({
          style = "light",               -- "auto" | "dark" | "light"
          transparent = true,
          italics = true,
          terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
          guicursor   = true,
        })
    end
}