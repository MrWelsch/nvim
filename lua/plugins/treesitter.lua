require'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
    ignore_install = {'haskell'},
    matchup = {
        enable = true,              
    },
    highlight = {
        enable = true
    },
    context_commentstring = {
        enable = true,
        config = {
          css = '// %s'
        },
        additional_vim_regex_highlighting = true,
      },
    indent = {enable = {"javascriptreact"}},
    autotag = {enable = true}, -- press ciw then 'esc' after editing a tag to autorename
}

