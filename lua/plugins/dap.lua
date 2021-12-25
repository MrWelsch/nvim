-- :DIInstall <debugger> asserts dependencies and if they are met, installs <debugger>.
-- :DIUninstall <debugger> uninstalls <debugger>.
-- :DIList lists installed debuggers.

local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})