

-- require('dapui').setup({
--   -- Configuration options go here
--   -- You can customize the layout, elements, and more
-- })
--
-- -- local dap = require('dap')
-- --
-- -- dap.configurations.typescript = {
-- -- 		{
-- -- 				name = "Launch",
-- -- 				type = "node2",
-- -- 				request = "launch",
-- -- 				program = "${workspaceFolder}/app.js",
-- -- 				cwd = vim.fn.getcwd(),
-- -- 				sourceMaps = true,
-- -- 				protocol = "inspector",
-- -- 				console = "integratedTerminal",
-- -- 		},
-- -- }
--
--
vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>dc", ":lua require('dap').continue()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})
