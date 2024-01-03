vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<Leader>dc", ":lua require('dap').continue()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>di", "<cmd>DapStepInto<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>dj", "<cmd>DapStepOver<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>do", "<cmd>DapStepOut<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", {noremap=true})


--
local dap = require('dap')

require('dap').set_log_level('DEBUG')

-- this one is for node in backend
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { '/home/uczen/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
}

dap.configurations.typescript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/build/index.js',  -- Adjust this path to your compiled JavaScript file
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    outFiles = { '${workspaceFolder}/build/**/*.js' },  -- Adjust this to your JavaScript output files
    console = 'integratedTerminal',
  },
}


--This one is for Angular
dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = {"/home/uczen/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js"}
}

dap.configurations.typescript = {
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
  }
}



dap.adapters.python = {
  type = 'executable';
  command = '/home/uczen/.local/share/nvim/mason/packages/debugpy/venv/bin/python'; -- Path to the Python executable in the virtual environment
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';  -- The type here should match the adapter name
    request = 'launch';
    name = "Launch file";
    program = "${file}";  -- This should point to the file you're debugging
    pythonPath = function()
      return '/usr/bin/python3'  -- Again, the path to the Python executable in the virtual environment
    end;
  },
}
