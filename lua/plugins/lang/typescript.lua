---@type LazySpec
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
        typescript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "js-debug-adapter" })
    end,
  },
  -- HACK: Works around https://github.com/vuki656/package-info.nvim/issues/164.
  {
    "vuki656/package-info.nvim",
    enabled = false,
  },
}
