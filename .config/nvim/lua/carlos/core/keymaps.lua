-- Sets leader key to the space key
vim.g.mapleader = " "

-- Pulls up explorer
vim.keymap.set("n", "<leader>vv", vim.cmd.Ex)

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
vim.keymap.set("n", "<leader>m", function()
	require("harpoon.mark").add_file()
end)
vim.keymap.set("n", "<leader>g", function()
	require("harpoon.ui").toggle_quick_menu()
end)
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
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "vc", ":VimtexCompile", opts)

-- Lsp jump binds
vim.keymap.set("n", "gt", function()
	vim.lsp.buf.definition()
end) -- go to
vim.keymap.set("n", "gp", function()
	vim.lsp.buf.hover()
end) -- get parameter

-- Tmux and Window navigator
vim.g.tmux_navigator_no_mappings = 1

vim.api.nvim_set_keymap("n", "<leader>h", ":<C-U>TmuxNavigateLeft<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>j", ":<C-U>TmuxNavigateDown<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", ":<C-U>TmuxNavigateUp<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":<C-U>TmuxNavigateRight<cr>", { silent = true })
-- vim.api.nvim_set_keymap('n', '<Previous-Mapping>', ':<C-U>TmuxNavigatePrevious<cr>', { silent = true })

-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>")
vim.api.nvim_command('command! NvimTreeToggle lua require("nvim-tree").toggle()')
