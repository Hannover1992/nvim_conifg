vim.api.nvim_set_keymap ("n", "<leader>dt", ":DapUiToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>dc", ":DapContinue<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dr", "lua require('dapui').open(freset = true})<CR>", {noremap=true})




local dap = require('dap')

dap.configurations.typescript = {
		{
				name = "Launch",
				type = "node2",
				request = "launch",
				program = "${workspaceFolder}/app.js",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
		},
}
