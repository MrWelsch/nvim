return {
    'hashivim/vim-terraform',
    lazy = false,
    config = function()
        local status_ok, terraform = pcall(require, "vim-terraform")
        if not status_ok then
            return
        end

        local cmd = vim.cmd

        cmd([[let g:terraform_fmt_on_save=1]])
        cmd([[let g:terraform_align=1]])

        -- keymap("n", "<leader>ti", ":!terraform init<CR>", opts)
        -- keymap("n", "<leader>tv", ":!terraform validate<CR>", opts)
        -- keymap("n", "<leader>tp", ":!terraform plan<CR>", opts)
        -- keymap("n", "<leader>taa", ":!terraform apply -auto-approve<CR>", opts)
    end
}

