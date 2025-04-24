return {
  lua = {
    lsp = "lua_ls",
    formatter = "stylua",
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
      },
    },
  },
  javascript = {  formatter = "prettier" },
  typescript = {  formatter = "prettier" },
  html = { lsp = "html", formatter = "prettier" },
  css = { lsp = "cssls", formatter = "prettier" },
  vue = { lsp = "volar", formatter = "prettier" },
}