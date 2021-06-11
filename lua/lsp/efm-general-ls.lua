-- Example configuations here: https://github.com/mattn/efm-langserver
-- TODO this file needs to be refactored eache lang should be it's own file



--local isort = {formatCommand = "isort --quiet -", formatStdin = true}


-- tsserver/web javascript react, vue, json, html, css, yaml
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
-- You can look for project scope Prettier and Eslint with e.g. vim.fn.glob("node_modules/.bin/prettier") etc. If it is not found revert to global Prettier where needed.
-- local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

require"lspconfig".efm.setup {
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    init_options = {
	    documentFormatting = true, 
	    codeAction = false,
	    hover = true,
    },
    filetypes = {"lua", "python", "javascriptreact", "javascript", "typescript","typescriptreact","sh", "html", "css", "json", "yaml", "markdown", "vue"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = {
		{LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
		lintStdin = true,
		lintFormats = {"%f:%l:%c: %m"}},
		{formatCommand = "yapf --quiet", formatStdin = true}
	    },
            lua = {
	    	{formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
	    	formatStdin = true}
	    },
            sh = {
		{formatCommand = 'shfmt -ci -s -bn', 
		formatStdin = true}
	    },
            javascript = {eslint},
            javascriptreact = {eslint},
	    typescript = {eslint},
	    typescriptreact = {eslint},
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
            markdown = {
		    {formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2', 
	    	    formatStdin = true}
	    }
        }
    }
}

-- Also find way to toggle format on save
-- maybe this will help: https://superuser.com/questions/439078/how-to-disable-autocmd-or-augroup-in-vim
