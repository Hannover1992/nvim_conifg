vim.g.mapleader = " "

--vim.keymap.set("n", "<leader>e", function() vim.cmd('Ex') end)
vim.keymap.set("n", "<leader>pr", function() vim.cmd('RnvimrToggle') end) 
-- vim.keymap.set("n", "<leader>r", function() vim.cmd('!sh run.sh') end, { noremap = true, silent = true })
vim.keymap.set("v", "<leader>c", [[:s/^/"/<CR>:noh<CR>]], { silent = true })



-- Center the screen when scrolling with Ctrl-d/u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center the screen when searching with n/N
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remap clipboard interactions for easier copying/pasting
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>pp", "\"+p")
