return{
    'nyoom-engineering/oxocarbon.nvim',
    -- lazy = false,
    -- priority = 1000,
    config = function()
        local status_ok, oxocarbon = pcall(require, "oxocarbon")
        if not status_ok then
            return
        end
        
        -- oxocarbon.setup {
        -- }
    end
}