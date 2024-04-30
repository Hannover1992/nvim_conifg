vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>e", function() vim.cmd('Ex') end)
vim.keymap.set("n", "<leader>pr", function() vim.cmd('RnvimrToggle') end) 
-- vim.keymap.set("n", "<leader>r", function() vim.cmd('!sh run.sh') end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", function()
    vim.cmd('!javac Main.java 2>&1 | tee /dev/tty | xclip -selection clipboard')
    vim.cmd('!javac Main.java && java Main')
end, { noremap = true, silent = true })


local function save_to_clipboard_and_show_errors()
  -- Speichere den Inhalt der aktuellen Datei in einer temporären Datei
  local temp_file = "/tmp/nvim_clipboard_append.txt"
  vim.cmd('w ' .. temp_file)

  -- Kompiliere die Java-Datei und leite Fehler in die temporäre Datei
  vim.fn.system('javac Main.java 2>&1 | tee -a ' .. temp_file)

  -- Kopiere den gesamten Inhalt der temporären Datei in die Zwischenablage
  vim.fn.system('cat ' .. temp_file .. ' | xclip -selection clipboard -i')

  -- Optional: Lösche die temporäre Datei, wenn sie nicht mehr benötigt wird
  vim.fn.delete(temp_file)
  vim.cmd('!javac Main.java && java Main')
end


-- Setze Keymaps, die die Funktionen aufrufen
vim.api.nvim_set_keymap('n', '<leader>r', '', { noremap = true, silent = true, callback = save_to_clipboard_and_show_errors })

-- Setze einen Keymap, der die Funktion aufruft


vim.keymap.set("v", "<leader>c", [[:s/^/"/<CR>:noh<CR>]], { silent = true })


--local mark = require("harpoon.mark")
--local ui   = require("harpoon.ui")


-- chat GPT



