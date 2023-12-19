vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<Leader>dc", ":lua require('dap').continue()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>di", "<cmd>DapStepInto<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>dj", "<cmd>DapStepOver<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>do", "<cmd>DapStepOut<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", {noremap=true})



local dap = require('dap')
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
