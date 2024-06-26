local builtin = require('telescope.builtin')


vim.keymap.set('n', '<leader>pf', 	function() builtin.find_files({}) end, {})
vim.keymap.set('n', '<C-p>p', 		function() builtin.git_files({}) end, {})
vim.keymap.set('n', '<leader>ps', 	function() builtin.grep_string({ 
	search = vim.fn.input("Grep > ") 
}) end, {})
vim.opt.tabstop = 4

