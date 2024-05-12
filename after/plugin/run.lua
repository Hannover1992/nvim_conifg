-- Configuration Variables
local config = {
    python = {
        compile_run = 'python3 {path}Main.py',
        cleanup = 'rm {path}*.pyc'
    },
    java = {
        compile_run = 'javac {path}Main.java && java -ea {path}Main.java',
        cleanup = 'rm {path}*.class'
    },
    c_sharp = {
        compile_run = 'mcs {path}Main.cs && mono {path}Main.exe',
        cleanup = 'rm {path}*.exe'
    },
    clipboard_cmd = 'xclip -selection clipboard -i'
}

-- Function to compile and display output, handle errors, and copy to clipboard
local function compile_and_handle_output(language)
    local lang_config = config[language]
    local compile_command = lang_config.compile_run:gsub("{path}", "./")

    -- Create buffer for the floating window
    local buf = vim.api.nvim_create_buf(false, true)
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")
    local win_height = math.ceil(height * 0.8)
    local win_width = math.ceil(width * 0.8)

    -- Open the floating window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = win_width,
        height = win_height,
        col = math.ceil((width - win_width) / 2),
        row = math.ceil((height - win_height) / 2),
        style = 'minimal',
        border = 'rounded',
    })

    -- Execute the compile command in a terminal within the floating window
    vim.fn.termopen(compile_command .. ' 2>&1', {
        on_exit = function()
            local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
            local errors = {}
            for _, line in ipairs(lines) do
                if line:match("error:") then
                    table.insert(errors, line)
                end
            end
            -- Concatenate current file content with errors and copy to clipboard
            local file_content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
            local all_content = file_content .. "\n" .. table.concat(errors, "\n")
            vim.fn.setreg('+', all_content)  -- Copy to clipboard
            vim.api.nvim_buf_set_option(buf, 'modifiable', false)
            vim.api.nvim_buf_set_keymap(buf, 'n', '<ESC>', '<cmd>bd!<CR>', {noremap = true, silent = true})
        end
    })
    vim.cmd('startinsert')
end

-- Key Mappings
vim.api.nvim_set_keymap('n', '<leader>rp', '', { noremap = true, silent = true, callback = function() compile_and_handle_output('python') end })
vim.api.nvim_set_keymap('n', '<leader>rj', '', { noremap = true, silent = true, callback = function() compile_and_handle_output('java') end })
vim.api.nvim_set_keymap('n', '<leader>rc', '', { noremap = true, silent = true, callback = function() compile_and_handle_output('c_sharp') end })
