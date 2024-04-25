
local function create_float_win()
    local buf = vim.api.nvim_create_buf(false, true) -- create new emtpy buffer
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    -- Calculate window size and position
    local win_height = math.ceil(height * 0.8 - 4)
    local win_width = math.ceil(width * 0.8)
    local row = math.ceil((height - win_height) / 2 - 1)
    local col = math.ceil((width - win_width) / 2)

    -- Set some options for the floating window
    local opts = {
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    }

    -- Create the floating window with the buffer attached
    local win = vim.api.nvim_open_win(buf, true, opts)

    -- Set the buffer's filetype to your preference for syntax highlighting or plain text
    vim.api.nvim_buf_set_option(buf, 'filetype', 'text')

    return buf, win
end
local function run_command_in_float_win(cmd)
    local buf, win = create_float_win()
    vim.fn.termopen(cmd, {
        on_exit = function()
            -- Optional: Automatically close the window after the command finishes
            -- vim.api.nvim_win_close(win, true)
            -- vim.cmd('ZenMode')
        end,
    })

    -- Enter insert mode to interact with the terminal (optional)
    vim.cmd('startinsert')
    -- vim.cmd('ZenMode')
end

-- vim.keymap.set('n', '<leader>r', function()
--     -- run_command_in_float_win("javac Main.java 2>&1 | tee >(xclip -selection c) ")
--     -- run_command_in_float_win("bash -c 'javac Application.java && java Application'")
--     run_command_in_float_win("bash -c 'npm run serve'")
-- end, { noremap = true, silent = true })
