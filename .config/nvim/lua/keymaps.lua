-- Harpoon
vim.keymap.set('n', '<leader>m', function() require("harpoon.mark").add_file() end)
vim.keymap.set('n', '<leader>g', function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set('n', '<leader>h', function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set('n', '<leader>j', function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set('n', '<leader>k', function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set('n', '<leader>l', function() require("harpoon.ui").nav_file(4) end)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})