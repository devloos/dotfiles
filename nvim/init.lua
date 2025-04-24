require("config.settings")

local languages = require("config.languages")

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

	{ "windwp/nvim-autopairs", opts = {} },

	-- Tree-sitter for syntax highlighting and more
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = true },
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
			local formatters_by_ft = {}
			for lang, config in pairs(languages) do
				if config.formatter then
					formatters_by_ft[lang] = { config.formatter }
				end
			end

			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = formatters_by_ft,
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for cmp
			"hrsh7th/cmp-buffer", -- buffer words
			"hrsh7th/cmp-path", -- file paths
			"hrsh7th/cmp-cmdline", -- command line completions
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- snippet completions
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-;>"] = cmp.mapping.complete(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	-- nvim-lspconfig for LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			for _, config in pairs(languages) do
				if config.lsp then
					lspconfig[config.lsp].setup({
						capabilities = capabilities,
						settings = config.settings or {},
					})
				end
			end

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
