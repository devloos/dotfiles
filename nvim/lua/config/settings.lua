-- General settings
vim.opt.termguicolors = true

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.backup = false
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- line numbers
vim.opt.number = true
vim.opt.numberwidth = 4

vim.opt.relativenumber = true

-- cursor line
vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus" -- this is two way clipboard copying.

-- Leader key
vim.g.mapleader = " "

-- Keymaps for Telescope
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })
end, { noremap = true })

vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep({ cwd = vim.fn.getcwd() })
end, { noremap = true })

-- Motion
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- cursor stays in middle
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- when halfpage jumping
vim.keymap.set("n", "<S-g>", "<S-g>zz") -- cursor stays in middle
vim.keymap.set("n", "}", "}zz") -- cursor stays in middle
vim.keymap.set("n", "{", "{zz") -- cursor stays in middle

vim.keymap.set("x", "<leader>p", '"_dP')
