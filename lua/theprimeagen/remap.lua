vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>e", function() vim.cmd('Ex') end)
vim.keymap.set("n", "<leader>pr", function() vim.cmd('RnvimrToggle') end) 
-- vim.keymap.set("n", "<leader>r", function() vim.cmd('!sh run.sh') end, { noremap = true, silent = true })
--
vim.keymap.set("n", "<leader>r", function()
    vim.cmd('!javac Main.java 2>&1 | tee /dev/tty | xclip -selection clipboard')
    vim.cmd('!javac Main.java && java -ea Main')
end, { noremap = true, silent = true })


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



-- Setze Keymaps, die die Funktionen aufrufen
vim.api.nvim_set_keymap('n', '<leader>r', '', { noremap = true, silent = true, callback = save_to_clipboard_and_show_errors })
vim.api.nvim_set_keymap('n', '<leader>r', '', { noremap = true, silent = true, callback = save_to_clipboard_and_show_errors_python })
-- vim.api.nvim_set_keymap('n', '<leader>r', '', { noremap = true, silent = true, callback = market })

-- Setze einen Keymap, der die Funktion aufruft


vim.keymap.set("v", "<leader>c", [[:s/^/"/<CR>:noh<CR>]], { silent = true })


--local mark = require("harpoon.mark")
--local ui   = require("harpoon.ui")


-- chat GPT
-- copilot

-- If you'd rather use a key that isn't <Tab>, define an <expr> map that calls
-- copilot#Accept().  Here's an example with CTRL-J:
-- 
--         imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
--         let g:copilot_no_tab_map = v:true
-- 
-- Lua version:
-- 
--         vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
--           expr = true,
--           replace_keycodes = false
--         })
--         vim.g.copilot_no_tab_map = true
--
 -- I would like to remap the...  I would like to remap the acceptance to control Y. 
