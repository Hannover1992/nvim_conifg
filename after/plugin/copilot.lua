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



-- Set the keymap in normal mode
vim.keymap.set('n', '<leader>ct', ToggleCopilot, { noremap = true, silent = true })
