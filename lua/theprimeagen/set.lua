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
vim.cmd('set undodir=os.getenv("HOME") .. "/.vim/undodir"')
