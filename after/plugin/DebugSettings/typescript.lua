
local dap = require('dap')

require('dap').set_log_level('DEBUG')


dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { '/home/uczen/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
}

-- Chrome Adapter
dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = {"/home/uczen/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js"}
}

-- Configurations
dap.configurations.typescript = {
  -- Node configuration
  {
    name = 'Launch Node',
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/build/index.js',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    outFiles = { '${workspaceFolder}/build/**/*.js' },
    console = 'integratedTerminal',
  },
  -- Chrome configuration
  {
    name = "Attach Chrome",
    type = "chrome",
    request = "attach",
    program = "${file}",
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
  },

}


