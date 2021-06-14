vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false

CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

require('options')
require('keybinds')
require('plugins')

vim.defer_fn(function()
    vim.cmd [[ bufdo e ]]
end, 0)
