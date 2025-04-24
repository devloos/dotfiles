-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- VS Code-like theme
	{
		"Mofiqul/vscode.nvim",
		name = "vscode",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("vscode")
		end,
	},

	-- Mason for LSP, linters, formatters
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{ "windwp/nvim-autopairs", opts = {} },

	-- Tree-sitter for syntax highlighting and more
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
			})
		end,
	},

	-- Telescope for fuzzy finding
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},
			})
		end,
	},

	-- Conform for formatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
				},
			})
		end,
	},

	-- nvim-lspconfig for LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- Diagnostic virtual text aligned to the right of the line
			vim.diagnostic.config({
				virtual_text = {
					prefix = "",
					spacing = 4,
					format = function(diagnostic)
						return diagnostic.message
					end,
				},
				signs = false, -- Disable signs in the gutter (left side)
			})
		end,
	},
})

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

vim.opt.clipboard = "unnamed" -- this is two way clipboard copying.

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
