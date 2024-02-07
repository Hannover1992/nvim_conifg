vim.keymap.set("n", "<leader>gs", function() vim.cmd("0Git") end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gl", function() vim.cmd("0Git log") end,{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>gD", function() vim.cmd("Gvdiffsplit") end,{ noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>gD", function() vim.cmd("G difftool -y") end,{ noremap = true, silent = true })
-- Function for Git add
--
vim.keymap.set("n", "<leader>ga", function()
    local should_add = vim.fn.input("Do you want to add all changes? (y/n): ")
    if should_add == 'y' then
        vim.cmd('!git add .')
        print("Added all changes.")
    else
        print("Skipped git add.")
    end
end, { noremap = true, silent = true })

-- Function for Git commit
vim.keymap.set("n", "<leader>gc", function()
    local commit_message = vim.fn.input("Enter commit message: ")
    if commit_message and #commit_message > 0 then
        vim.cmd('!git commit -m "' .. commit_message .. '"')
        print("Committed with message: " .. commit_message)
    else
        print("Commit message is empty. Aborting commit.")
    end
end, { noremap = true, silent = true })



