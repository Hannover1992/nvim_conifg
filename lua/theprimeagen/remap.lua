vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>e", function() vim.cmd('Ex') end)
vim.keymap.set("n", "<leader>pr", function() vim.cmd('RnvimrToggle') end) 
--vim.keymap.set("n", "<leader>r", function() vim.cmd('!sh run.sh') end, { noremap = true, silent = true })


vim.keymap.set("n", "<leader>r", function()
    local current_path = vim.fn.expand('%:p:h')
    local user_command = vim.fn.input("Run command in " .. current_path .. ": ")
    if user_command and #user_command > 0 then
        vim.cmd('!cd ' .. current_path .. ' && ' .. user_command)
    end
end, { noremap = true, silent = true })


vim.keymap.set("v", "<leader>c", [[:s/^/"/<CR>:noh<CR>]], { silent = true })


--local mark = require("harpoon.mark")
--local ui   = require("harpoon.ui")


-- chat GPT

