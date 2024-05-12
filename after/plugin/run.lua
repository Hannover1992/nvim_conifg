-- python()
java()
-- c_sharp()


local function python()
    local function save_to_clipboard_and_show_errors_python()
        --
        local path = ""
        local temp_file = "/tmp/nvim_clipboard_append.txt"
        vim.cmd('w ' .. temp_file)
        vim.fn.system('python3 ' .. path .. 'Main.py 2>&1 | tee -a ' .. temp_file)
        vim.fn.system('cat ' .. temp_file .. ' | xclip -selection clipboard -i')
        vim.fn.delete(temp_file)
        vim.cmd('!python3 ' .. path .. 'Main.py && rm ' .. path .. '*.class')
    end
    vim.api.nvim_set_keymap('n', '<leader>r', '', { noremap = true, silent = true, callback = save_to_clipboard_and_show_errors_python })
end

local function java()
    local function save_to_clipboard_and_show_errors()
        --
        local path = "./"
        local temp_file = "/tmp/nvim_clipboard_append.txt"
        vim.cmd('w ' .. temp_file)
        vim.fn.system('javac ' .. path .. 'Main.java 2>&1 | tee -a ' .. temp_file)
        vim.fn.system('cat ' .. temp_file .. ' | xclip -selection clipboard -i')
        vim.fn.delete(temp_file)
        vim.cmd('!javac ' .. path .. 'Main.java && java -ea ' .. path .. 'Main.java && rm ' .. path .. '*.class')
    end
    vim.api.nvim_set_keymap('n', '<leader>r', '', { noremap = true, silent = true, callback = save_to_clipboard_and_show_errors })
end

local function c_sharp()
    local function save_to_clipboard_and_show_errors_c_sharp()
        --
        local path = ""
        local temp_file = "/tmp/nvim_clipboard_append.txt"
        vim.cmd('w ' .. temp_file)
        vim.fn.system('mcs ' .. path .. 'Main.cs 2>&1 | tee -a ' .. temp_file)
        vim.fn.system('cat ' .. temp_file .. ' | xclip -selection clipboard -i')
        vim.fn.delete(temp_file)
        vim.cmd('!mcs ' .. path .. 'Main.cs && mono ' .. path .. 'Main.exe && rm ' .. path .. '*.exe')
    end
    vim.api.nvim_set_keymap('n', '<leader>r', '', { noremap = true, silent = true, callback = save_to_clipboard_and_show_errors_c_sharp })
end



-- vim.keymap.set("n", "<leader>r", function()
--     vim.cmd('!javac Main.java 2>&1 | tee /dev/tty | xclip -selection clipboard')
--     vim.cmd('!javac Main.java && java -ea Main')
-- end, { noremap = true, silent = true })
--
--
-- local function save_to_clipboard_and_show_errors()
--   --
--   local path = "./"
--
--   local temp_file = "/tmp/nvim_clipboard_append.txt"
--   vim.cmd('w ' .. temp_file)
--
--   vim.fn.system('javac ' .. path .. 'Main.java 2>&1 | tee -a ' .. temp_file)
--   vim.fn.system('cat ' .. temp_file .. ' | xclip -selection clipboard -i')
--
--   vim.fn.delete(temp_file)
--   vim.cmd('!javac ' .. path .. 'Main.java && java -ea ' .. path .. 'Main.java && rm ' .. path .. '*.class')
--
--
-- end
--
--
-- local function save_to_clipboard_and_show_errors_python()
--     --
--     local path = ""
--     local temp_file = "/tmp/nvim_clipboard_append.txt"
--     vim.cmd('w ' .. temp_file)
--     vim.fn.system('python3 ' .. path .. 'Main.py 2>&1 | tee -a ' .. temp_file)
--     vim.fn.system('cat ' .. temp_file .. ' | xclip -selection clipboard -i')
--     vim.fn.delete(temp_file)
--     vim.cmd('!python3 ' .. path .. 'Main.py && rm ' .. path .. '*.class')
-- end



-- Setze Keymaps, die die Funktionen aufrufen
-- vim.api.nvim_set_keymap('n', '<leader>r', '', { noremap = true, silent = true, callback = save_to_clipboard_and_show_errors })
-- vim.api.nvim_set_keymap('n', '<leader>r', '', { noremap = true, silent = true, callback = save_to_clipboard_and_show_errors_python })
-- vim.api.nvim_set_keymap('n', '<leader>r', '', { noremap = true, silent = true, callback = market })
