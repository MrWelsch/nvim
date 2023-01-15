--> MEASURE START TIME
vim.g.start_time = vim.fn.reltime()

--> CACHING
local status_ok, impatient = pcall(require, 'impatient')
if status_ok then 
    impatient.enable_profile() 
end

--> REQUIREMENTS
require('general.options')
require('general.mappings')
require('general.packer')

--> SET COLORSCHEME
require('ui.colorschemes').catppuccin(false)
