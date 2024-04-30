vim.keymap.set("n", "<leader>gs", function() vim.cmd("0Git") end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gl", function() vim.cmd("0Git log") end,{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>gD", function() vim.cmd("Gvdiffsplit") end,{ noremap = true, silent = true })


vim.keymap.set("n", "<leader>gL", function()
    local numCommits = tonumber(vim.fn.input("Anzahl der Commits eingeben: "))
    if numCommits == nil or numCommits <= 0 then
        return
    end
    local command = "Gvdiffsplit HEAD~" .. numCommits
    vim.cmd(command)
end, { noremap = true, silent = true })
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



-- mein eigen entwicklugn

-- function OpenAndDiff()
--     -- Ersetze 'your-branch' mit dem Namen deines Branches, gegen den du vergleichen möchtest
--     local branch = "AL-973"
--     local development_branch = "development"
--     -- Holt die Liste der Dateien, die sich zwischen den beiden Branches unterscheiden
--     local files = vim.fn.systemlist("git diff --name-only " .. branch .. ".." .. development_branch)
--     -- Öffnet jede Datei in einem neuen Tab und führt Gdiffsplit aus
--     for _, file in ipairs(files) do
--         vim.cmd("tabnew " .. file)
--         vim.cmd("Gdiffsplit " .. development_branch)
--     end
-- end
--
--
-- vim.api.nvim_set_keymap('n', '<leader>gt', ':lua OpenAndDiff()<CR>', { noremap = true, silent = true })
--

