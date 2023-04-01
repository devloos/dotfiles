local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Sets leader key to the space key
vim.g.mapleader = " "

-- motion
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- cursor stays in middle
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- when halfpage jumping
vim.keymap.set("n", "<S-g>", "<S-g>zz") -- cursor stays in middle
vim.keymap.set("n", "}", "}zz") -- cursor stays in middle
vim.keymap.set("n", "{", "{zz") -- cursor stays in middle

-- x mode is when your highlighting over something
vim.keymap.set("x", "<leader>p", '"_dP')

-- Split Screen Binds
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close split window

-- Tab Binds
vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- opne new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to prev tab

-- Harpoon
-- vim.keymap.set("n", "<leader>m", function()
-- 	require("harpoon.mark").add_file()
-- end)
-- vim.keymap.set("n", "<leader>g", function()
-- 	require("harpoon.ui").toggle_quick_menu()
-- end)

-- vim.keymap.set('n', '<leader>h', function() require("harpoon.ui").nav_file(1) end)
-- vim.keymap.set('n', '<leader>j', function() require("harpoon.ui").nav_file(2) end)
-- vim.keymap.set('n', '<leader>k', function() require("harpoon.ui").nav_file(3) end)
-- vim.keymap.set('n', '<leader>l', function() require("harpoon.ui").nav_file(4) end)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "git", builtin.git_files, {})
vim.keymap.set("n", "fg", builtin.live_grep, {})
vim.keymap.set("n", "fb", builtin.buffers, {})
vim.keymap.set("n", "fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Vimtex
keymap("n", "vc", ":VimtexCompile", opts)

-- goto
vim.keymap.set("n", "<C-i>", function()
	vim.lsp.buf.definition()
end)

-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
vim.keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>") -- toggle tree open/close
keymap("n", "<C-n>", "<C-w>h", opts) -- toggle cursor to tree
keymap("n", "<C-m>", "<C-w>l", opts) -- toggle cursor back to open file
