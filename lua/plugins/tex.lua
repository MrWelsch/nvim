return {
    'aspeddro/tex.nvim',
    config = function()
        local status_ok, tex = pcall(require, "tex")
        if not status_ok then
            return
        end

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
    end
}