-- Toggle Copilot and open Copilot panel with Lua in Neovim
vim.keymap.set('n', '<leader>cp', function() vim.cmd('Copilot panel') end, { noremap = true, silent = true })

-- If you'd rather use a key that isn't <Tab>, define an <expr> map that calls
-- copilot#Accept().  Here's an example with CTRL-J:

vim.keymap.set('i', '<C-j>', 'copilot#Accept()', { noremap = true, silent = true, expr = true })



