local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup {
    -- ensure_installed = 'maintained',
    ignore_install = {'haskell'},
    matchup = {
        enable = true,              
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    autopairs = {
        enable = true
    },
    autotag = { -- press ciw then 'esc' after editing a tag to autorename
        enable = true
    }, 
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    indent = {
        enable = true, 
        disable = { "yaml" },
    },
}

