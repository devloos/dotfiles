-- Vim opt
vim.opt.backup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
vim.opt.rnu = true
vim.opt.cc = "90"
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.smartindent = true

-- Theme
vim.o.background = 'dark'
require('vscode').setup{}

-- Lualine
require('lualine').setup{
  options = {
    theme = 'vscode'
  }
}

-- Treesitter
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  rainbow = {
    enable = true,
  }
}