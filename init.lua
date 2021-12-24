-- CONFIG_PATH = vim.fn.stdpath('config')
-- DATA_PATH = vim.fn.stdpath('data')
-- CACHE_PATH = vim.fn.stdpath('cache')

require('general.options')
require('general.mappings')
require('general.packer')

require('ui.colorschemes').tokyodark(false)