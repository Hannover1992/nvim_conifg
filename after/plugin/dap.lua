vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<Leader>dc", ":lua require('dap').continue()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>di", "<cmd>DapStepInto<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>dj", "<cmd>DapStepOver<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>do", "<cmd>DapStepOut<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", {noremap=true})


local dap = require('dap')

-- -- this is for the c# developemen
--
-- dap.adapters.coreclr = {
--   type = 'executable',
--   command = '/home/uczen/.local/share/nvim/mason/packages/netcoredbg/netcoredbg', -- Pfad zu netcoredbg
--   args = {'--interpreter=vscode'}
-- }
--
-- dap.configurations.cs = {
--   {
--     type = "coreclr",
--     name = "launch - netcoredbg",
--     request = "launch",
--     program = function()
--       -- Automatischer Pfad zur DLL
--       local project_name = 'Service.Algo.Avis'  -- Projektname
--       local build_dir = '/mnt/Brain/9Work/GLB/code/Service.Algo.Avis/src/1-Services/Service.Algo.Avis/bin/Debug/net6.0/' -- Pfad zum Build-Verzeichnis
--       return build_dir .. project_name .. '.dll'
--     end,
--   },
-- }


-- google-chrome --remote-debugging-port=9222 --user-data-dir=/home/uczen/.temp/google


-- require('dap').set_log_level('DEBUG')
--
--
--
-- -- Node Adapter
-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node',
--   args = { '/home/uczen/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
-- }
--
-- -- Chrome Adapter
-- dap.adapters.chrome = {
--   type = "executable",
--   command = "node",
--   args = {"/home/uczen/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js"}
-- }
--
-- dap.adapters.coreclr = {
--   type = 'executable',
--   command = '/home/uczen/.local/share/nvim/mason/packages/netcoredbg/netcoredbg',
--   args = {'--interpreter=vscode'}
-- }
--
-- -- Configurations
-- dap.configurations.typescript = {
--   -- Node configuration
--   {
--     name = 'Launch Node',
--     type = 'node2',
--     request = 'launch',
--     program = '${workspaceFolder}/build/index.js',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     outFiles = { '${workspaceFolder}/build/**/*.js' },
--     console = 'integratedTerminal',
--   },
--   -- Chrome configuration
--   {
--     name = "Attach Chrome",
--     type = "chrome",
--     request = "attach",
--     program = "${file}",
--     sourceMaps = true,
--     protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}"
--   },
--
-- }



--
local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = '/home/uczen/.local/share/nvim/mason/packages/netcoredbg/netcoredbg', -- Path to netcoredbg
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      local project_name = 'Service.Algo.Avis'  -- Aktualisierter Projektname
      -- local build_dir = vim.fn.getcwd() .. '/src/1-Services/Service.Algo.Avis/bin/Debug/net6.0/' -- Angepasster Pfad
      local build_dir = vim.fn.getcwd() .. '/src/1-Services/Service.Algo.Avis/' -- Angepasster Pfad
      return build_dir .. project_name .. '.dll'
    end,
  },
}

--
--
-- local dap = require('dap')
--
-- dap.adapters.python = {
--   type = 'executable';
--   command = '/home/uczen/.local/share/nvim/mason/packages/debugpy/venv/bin/python'; -- Path to the Python executable in the virtual environment
--   args = { '-m', 'debugpy.adapter' };
-- }
--
-- dap.configurations.python = {
-- 	  {
-- 	name = 'pythone debug run',
-- 	    type = 'python';  -- The type here should match the adapter name
-- 	    request = 'launch';
-- 	    program = "${file}";  -- This should point to the file you're debugging
-- 	    pythonPath = function()
-- 	      return '/usr/bin/python3'  -- Again, the path to the Python executable in the virtual environment
-- 	    end;
-- 	  }
--   }
