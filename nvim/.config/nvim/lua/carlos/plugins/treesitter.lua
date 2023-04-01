-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- treesitter for pretty colors
treesitter.setup({
	highlight = {
		enable = true,
	},

	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"yaml",
		"html",
		"css",
		"bash",
		"lua",
		"vim",
		"gitignore",
		"cpp",
		"java",
		"vue",
		"rust",
		"cmake",
		"php",
	},

	auto_install = true,
})
