-- Assuming 'copilot_active' is a variable you manage to track its state
local copilot_active = false

function ToggleCopilot()
    if copilot_active then
        -- Disable Copilot
        vim.cmd('Copilot disable')  -- Replace with the actual command to disable Copilot
        copilot_active = false
    else
        -- Enable Copilot
        vim.cmd('Copilot enable')  -- Replace with the actual command to enable Copilot
        copilot_active = true
    end
end




-- -- fass die funktio oben zusammen
-- Setze die Keymaps für Normal- und Insert-Modus
local modes = {'n', 'i'}
for _, mode in ipairs(modes) do
  vim.keymap.set(mode, '<leader>ct', ToggleCopilot, { noremap = true, silent = true })
end


-- Toggle Copilot and open Copilot panel with Lua in Neovim
vim.keymap.set('n', '<leader>cp', function() vim.cmd('Copilot panel') end, { noremap = true, silent = true })

-- If you'd rather use a key that isn't <Tab>, define an <expr> map that calls
-- copilot#Accept().  Here's an example with CTRL-J:

vim.keymap.set('i', '<C-j>', 'copilot#Accept()', { noremap = true, silent = true, expr = true })



