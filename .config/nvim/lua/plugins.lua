-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Auto Pairs
  use 'jiangmiao/auto-pairs'

  -- Harpoon
  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/harpoon'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.0'
  }

  -- LSP
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim L

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- LuaLine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Theme
  use 'Mofiqul/vscode.nvim'

  -- CMD Comments
  use "terrortylor/nvim-comment"

  use "lukas-reineke/indent-blankline.nvim"

end)
