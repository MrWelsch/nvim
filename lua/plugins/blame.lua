return {
    'f-person/git-blame.nvim', 
    -- event = 'InsertEnter',
    config = function()
        local status_ok, blame = pcall(require, "gitblame")
        if not status_ok then
            return
        end

        --> OPTIONS
        blame.setup {
            enabled = true,
        }

        vim.g.gitblame_display_virtual_text = 0
        vim.g.gitblame_message_template = '<date> • <author>'
        vim.g.gitblame_date_format = '%x'
    end
}