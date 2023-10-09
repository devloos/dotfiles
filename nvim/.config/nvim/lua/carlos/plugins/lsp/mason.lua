-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

-- servers
mason_lspconfig.setup({
	ensure_installed = {
		"clangd",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"eslint",
		"jsonls",
		"jdtls",
		"tsserver",
		"texlab",
		"volar",
		"rust_analyzer",
		"cmake",
		"intelephense",
		"pyright",
	},

	automatic_installation = true,
})

-- formatters and linters
mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"clang_format",
		"stylua",
		"rustfmt",
		"eslint_d",
		"chktex",
		"cppcheck",
		"autopep8",
	},

	automatic_installation = true,
})
