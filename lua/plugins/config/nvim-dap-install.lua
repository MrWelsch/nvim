local dap = require('dap-install')

local debugger_list = require('dap-install.debuggers_list').debuggers

dap.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
	verbosely_call_debuggers = false,
})

for debugger, _ in pairs(debugger_list) do
	dap.config(debugger, {})
end