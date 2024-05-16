-- Set relative numbering
vim.opt.relativenumber = true

-- Enable smart indentation
vim.opt.smartindent = true

-- Set line numbering
vim.opt.number = true

-- Set indentation options
vim.opt.tabstop = 4       -- Number of space characters inserted for a tab
vim.opt.softtabstop = 4   -- See ':help softtabstop' for details
vim.opt.shiftwidth = 4    -- Width for autoindents
vim.opt.expandtab = true  -- Converts tabs to spaces

-- Disable GUI cursor
vim.opt.guicursor = ""

-- Automatically save and load folds
vim.cmd([[
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* try | silent loadview | catch /E484/ | endtry
]])

-- Disable swap file
vim.opt.swapfile = false

-- Disable backup file
vim.opt.backup = false

-- Enable terminal GUI colors
vim.opt.termguicolors = true



vim.lsp.set_log_level("debug")

-- -- Aktiviert die Anzeige von unsichtbaren Zeichen
-- vim.opt.list = true
--
-- -- Konfiguriert, welche unsichtbaren Zeichen wie dargestellt werden
-- -- Leerzeichen werden als Punkte angezeigt
-- -- Tabs werden als Pfeile dargestellt, gefolgt von einem Leerzeichen
-- vim.opt.listchars = "space:⋅,tab:→ "
--
-- -- Optional: Wenn du auch das Ende von Zeilen darstellen möchtest
-- vim.opt.listchars:append("eol:↴")
--

