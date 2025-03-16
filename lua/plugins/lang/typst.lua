---@type LazySpec
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        typst = { "typstyle", lsp_format = "prefer" },
      },
    },
  },
  {
    "chomosuke/typst-preview.nvim",
    keys = {
      { "<Leader>lp", "<CMD>TypstPreviewToggle<CR>", desc = "Toggle Preview", ft = "typst" },
    },
    opts = {
      dependencies_bin = {
        websocat = "websocat",
      },
    },
  },
}
