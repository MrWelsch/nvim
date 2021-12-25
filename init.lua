--> MEASURE START TIME
vim.g.start_time = vim.fn.reltime()

--> REQUIREMENTS
require('general.options')
require('general.mappings')
require('general.packer')

require('ui.colorschemes').tokyonight(false)