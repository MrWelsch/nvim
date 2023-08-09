-- Launch or attach to a running Javascript/Typescript process
local jsOrTs = {
    {
      type = 'node2',
      name = 'Launch',
      request = 'launch',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    {
      type = 'node2',
      name = 'Attach',
      request = 'attach',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    {
      name = "Vitest Debug",
      type = "pwa-node",
      request = "launch",
      cwd = vim.fn.getcwd(),
      program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
      args = { "--threads", "false", "run", "${file}" },
      autoAttachChildProcesses = true,
      smartStep = true,
      console = "integratedTerminal",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
  }
  
  local function get_arguments()
    local co = coroutine.running()
    if co then
      return coroutine.create(function()
        local args = {}
        vim.ui.input({ prompt = "Args: " }, function(input)
          args = vim.split(input or "", " ")
        end)
        coroutine.resume(co, args)
      end)
    else
      local args = {}
      vim.ui.input({ prompt = "Args: " }, function(input)
        args = vim.split(input or "", " ")
      end)
      return args
    end
  end
  
  return {
    setup = function(dap)
      dap.configurations = {
        javascript = jsOrTs,
        typescript = jsOrTs,
      }
    end
  }