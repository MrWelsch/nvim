--> MEASURE START TIME
vim.g.start_time = vim.fn.reltime()

--> CACHING
local ok, impatient = pcall(require, 'impatient')

if ok then impatient.enable_profile() end

--> REQUIREMENTS
require('general.options')
require('general.mappings')
require('general.packer')

require('ui.colorschemes').tokyonight(false)