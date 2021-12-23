-- vim.g.vimtex_compiler_progname = 'nvr'
-- vim.g.vimtex_view_method = 'zathura'
-- vim.g.vimtex_compiler_latexmk_engines = {
-- 	['_'] = '-xelatex',
-- }

local tex = require'tex'

tex.setup{
    engine = 'latexmk', -- tex engine
    compile = {
        events = { 'BufWritePost' }, -- compile when buffer is saved
        watchlist = true -- enable feature to compile file when any file from watch list is changed
    },
    viewer = nil,
    engines = { -- engines config
        tectonic = {},
        latexmk = {
        args = {
            '-pdf',
            ['-interaction'] = 'nonstopmode'
        }
        },
        pdflatex = {
        args = {
            ['-interaction'] = 'nonstopmode'
        }
        },
        xelatex = {
        args = {
            ['-interaction'] = 'nonstopmode'
        }
        },
        lualatex = {
        args = {
            ['-interaction'] = 'nonstopmode'
        }
        }
    }
  
}