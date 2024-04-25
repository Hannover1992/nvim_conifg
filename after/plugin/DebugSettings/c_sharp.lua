local dap = require('dap')

require('dap').set_log_level('DEBUG')


dap.adapters.coreclr = {
  type = 'executable',
  command = '/home/uczen/.local/share/nvim/mason/packages/netcoredbg/netcoredbg', -- Ensure this path is correct
  args = {'--interpreter=vscode'}
}
--
-- -- Define debugging configurations for C# projects
dap.configurations.cs = {
  {
    -- Configuration name that appears in the debugging start menu
    type = "coreclr",
    name = "Launch - Service.Algo.Avis",
    request = "launch",

    -- Determines the path to the DLL file to debug
    program = function()
      -- Here, we assume your DLL is in the standard .NET build output directory
	  local project_name = 'Service.Algo.Avis' -- The exact name of your project
      local project_name = 'Asd.Service.Algo.WebApp' -- The exact name of your project
      local project_name = 'Asd.Service.Algo.Zuko' -- The exact name of your project
      -- local project_name = 'Asd.Service.Algo.Dashboard'

	  -- local build_dir = vim.fn.getcwd() .. '/bin/Debug/net6.0/'
      local build_dir = vim.fn.getcwd() .. '/src/1-Services/' .. project_name .. '/bin/Debug/net6.0/' -- Adjust the path as needed
      return build_dir .. project_name .. '.dll'

    end,

    -- Sets the current working directory to the project root
	cwd = vim.fn.getcwd(),

    -- Example of setting environment variables for the debug session
    env = function()
      return { }
    end,

    -- Controls whether the debugger stops at the entry point of the program
    stopAtEntry = true, -- Change to true if you want to break at the program start
  },
}

