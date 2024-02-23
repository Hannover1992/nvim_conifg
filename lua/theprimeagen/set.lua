-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.shiftwidth = 4

vim.cmd('set relativenumber')
vim.cmd('set number')
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set guicursor=""')

vim.optswapfile=false
vim.optbackup=false
-- unenlich lange dree back
-- vim.cmd('set undodir=os.getenv("HOME") .. "/.vim/undodir"')
vim.opt.termguicolors=true
-- Let the curso stay in the middle whiel jumping half page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- also whiel search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- the grates reamp teh clipbaor of th ecomputer 
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- the grates reamp teh clipbaor of th ecomputer 
vim.keymap.set("n", "<leader>pp", "\"+p")


