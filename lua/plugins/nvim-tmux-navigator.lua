return {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    config = function()
        local status_ok, tmux_navigator = pcall(require, "vim-tmux-navigator")
        if not status_ok then
            return
        end

        tmux_navigator.setup({
            vim.keymap.set('n', 'C-e', ':TmuxNavigateUp<CR>'),
            vim.keymap.set('n', 'C-i', ':TmuxNavigateDown<CR>'),
            vim.keymap.set('n', 'C-n', ':TmuxNavigateLeft<CR>'),
            vim.keymap.set('n', 'C-o', ':TmuxNavigateRight<CR>'),
        })
    end
}