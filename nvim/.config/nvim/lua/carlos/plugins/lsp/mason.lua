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

mason_lspconfig.setup({
	-- list of servers for mason to install
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
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		-- formatters
		"prettier",
		"clang_format",
		"stylua",
		"rustfmt",
		-- linters
		"eslint_d",
		"chktex",
		"cppcheck",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})