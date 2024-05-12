vim.g.mapleader = " "

--vim.keymap.set("n", "<leader>e", function() vim.cmd('Ex') end)
vim.keymap.set("n", "<leader>pr", function() vim.cmd('RnvimrToggle') end) 
-- vim.keymap.set("n", "<leader>r", function() vim.cmd('!sh run.sh') end, { noremap = true, silent = true })
vim.keymap.set("v", "<leader>c", [[:s/^/"/<CR>:noh<CR>]], { silent = true })

