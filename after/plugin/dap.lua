vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<Leader>dc", ":lua require('dap').continue()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>di", "<cmd>DapStepInto<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>dj", "<cmd>DapStepOver<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>do", "<cmd>DapStepOut<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", {noremap=true})


local dap = require('dap')

require('dap').set_log_level('DEBUG')


local function configure_c_sharp_debugger()

	dap.adapters.coreclr = {
		type = 'executable',
		command = '/home/uczen/.local/share/nvim/mason/packages/netcoredbg/netcoredbg', -- Ensure this path is correct
		args = {'--interpreter=vscode'}
	}

	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "Launch - Service.Algo.Avis",
			request = "launch",
			program = function()
				local project_name = 'Service.Algo.Avis' -- The exact name of your project
				local project_name = 'Asd.Service.Algo.WebApp' -- The exact name of your project
				local project_name = 'Asd.Service.Algo.Zuko' -- The exact name of your project
				local build_dir = vim.fn.getcwd() .. '/src/1-Services/' .. project_name .. '/bin/Debug/net6.0/' -- Adjust the path as needed
				return build_dir .. project_name .. '.dll'

			end,

			cwd = vim.fn.getcwd(),

			env = function()
				return { }
			end,

			stopAtEntry = true, -- Change to true if you want to break at the program start
		},
	}

end

local function configure_python_debugger()
	dap.adapters.python = {
		type = 'executable';
		command = '/home/uczen/.local/share/nvim/mason/packages/debugpy/venv/bin/python'; -- Path to the Python executable in the virtual environment
		args = { '-m', 'debugpy.adapter' };
	}

	dap.configurations.python = {
		{
			name = 'pythone debug run',
			type = 'python';  -- The type here should match the adapter name
			request = 'launch';
			program = "${file}";  -- This should point to the file you're debugging
			pythonPath = function()
				return '/usr/bin/python3'  -- Again, the path to the Python executable in the virtual environment
			end;
		}
	}

end

local function configure_typescript_debugger()

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


end


configure_typescript_debugger()
-- configure_python_debugger()
-- configure_c_sharp_debugger()

