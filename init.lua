--> MEASURE START TIME
vim.g.start_time = vim.fn.reltime()

--> REQUIREMENTS
require('general.options')
require('general.mappings')
require('load_plugins')

--> SET COLORSCHEME
require('plugins.colorschemes.init').gruvbox(false)