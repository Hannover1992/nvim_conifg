-- Constants for configuration
local TEMP_FILE_PATH = "/tmp/nvim_clipboard_append.txt"
local WINDOW_HEIGHT_FACTOR = 0.8
local WINDOW_WIDTH_FACTOR = 0.8
local ERROR_PATTERN = "error:"
--
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


-- Retrieves the configuration for the given language
local function get_language_config(language)
    return config[language]
end

-- Writes the current file content to a temporary file
local function write_current_file_to_temp(temp_file)
    vim.cmd('w! ' .. temp_file)
end

-- Creates a floating window and returns the buffer and window IDs
local function create_floating_window()
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")
    local win_height = math.ceil(height * WINDOW_HEIGHT_FACTOR)
    local win_width = math.ceil(width * WINDOW_WIDTH_FACTOR)
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = win_width,
        height = win_height,
        col = math.ceil((width - win_width) / 2),
        row = math.ceil((height - win_height) / 2),
        style = 'minimal',
        border = 'rounded',
    })
    return buf, win
end

-- Compiles code and handles output in the terminal
local function compile_and_handle_output_in_terminal(buf, compile_command)
    vim.fn.termopen(compile_command .. ' 2>&1', {
        on_exit = function()
            local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
            local errors = {}
            for _, line in ipairs(lines) do
                if line:match(ERROR_PATTERN) then
                    table.insert(errors, line)
                end
            end
            local file_content = vim.fn.system('cat ' .. TEMP_FILE_PATH)
            local all_content = "Current File Content:\n" .. file_content .. "\n\nErrors:\n" .. table.concat(errors, "\n")
            vim.fn.setreg('+', all_content)  -- Copy to clipboard
            vim.api.nvim_buf_set_option(buf, 'modifiable', false)
            vim.api.nvim_buf_set_keymap(buf, 'n', '<ESC>', '<cmd>bd!<CR>', {noremap = true, silent = true})
        end
    })
end

-- Main compilation and output handling function
local function compile_and_handle_output(language)
    local lang_config = get_language_config(language)
    local compile_command = lang_config.compile_run:gsub("{path}", "./")

    write_current_file_to_temp(TEMP_FILE_PATH)
    local buf, win = create_floating_window()
    compile_and_handle_output_in_terminal(buf, compile_command)

    vim.cmd('startinsert') -- Consider whether this is necessary
end

-- Key Mappings
vim.api.nvim_set_keymap('n', '<leader>rp', '', { noremap = true, silent = true, callback = function() compile_and_handle_output('python') end })
vim.api.nvim_set_keymap('n', '<leader>rj', '', { noremap = true, silent = true, callback = function() compile_and_handle_output('java') end })
vim.api.nvim_set_keymap('n', '<leader>rc', '', { noremap = true, silent = true, callback = function() compile_and_handle_output('c_sharp') end })
