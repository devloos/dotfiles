-- Vim opt
local opt = vim.opt

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.backup = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line numbers
opt.number = true
opt.numberwidth = 4
opt.relativenumber = true

-- cursor line
opt.cursorline = true
opt.cursorcolumn = true
opt.mouse = "a"

-- vim.opt.clipboard = "unnamedplus" -- this is one way clipboard copying
opt.clipboard = "unnamed" -- this is two way clipboard copying. beware everything outside of vim register will be there now

-- Theme
-- vim.o.background = "dark"
-- require("vscode").setup({}) -- vscode theme
-- vim.cmd([[colorscheme gruvbox]])
