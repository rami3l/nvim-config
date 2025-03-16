---@type LazySpec
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        vue = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
      },
    },
  },
}
