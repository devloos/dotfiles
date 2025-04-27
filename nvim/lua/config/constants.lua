local constants = {}

constants.lsps = {
	"lua_ls",
	"eslint_d",
	"html",
	"cssls",
	"clangd",
	"tailwindcss",
	"cmake",
	"intelephense",
	"pyright",
	"bashls",
}

constants.formatters = {
	lua = "stylua",
	javascript = "prettier",
	typescript = "prettier",
	html = "prettier",
	css = "prettier",
	scss = "prettier",
	vue = "prettier",
	json = "prettier",
	yaml = "prettier",
	markdown = "prettier",
	dockerfile = "prettier",
	python = "autopep8",
	cpp = "clang-format",
	c = "clang-format",
}

constants.excludes = {
	".git",
	"node_modules",
	"build",
	"dist",
	"out",
	"bin",
	"target",
	".next",
	".nuxt",
	".idea",
	".vscode",
	"coverage",
	".venv",
	"env",
	"venv",
	".parcel-cache",
	".cache",
	"__pycache__",
	"cmake-build-debug",
}

return constants
