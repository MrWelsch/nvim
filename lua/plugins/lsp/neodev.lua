return {
    'folke/neodev.nvim',
    config = function()
        local status_ok, neodev = pcall(require, "neodev")
        if not status_ok then
            return
        end

        neodev.setup({
            -- enable type checking for nvim-dap-ui to get type checking, 
            -- documentation and autocompletion for all API functions.
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })
    end
}

