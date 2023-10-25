-- This should be at the beginning of your configuration
vim.g.mapleader = " "  -- sets the leader key to space

-- ... your other configurations ...

local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Your key mappings with the new leader key
set_keymap('n', '<leader>pv', ':Ex<CR>', opts)
set_keymap('n', '<leader>pr', ':RnvimrToggle<CR>', opts)
set_keymap('n', '<leader>r', ':!sh run.sh<CR>', opts)
