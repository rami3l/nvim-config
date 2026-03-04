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
      { "<Leader>lp", "<Cmd>TypstPreviewToggle<Cr>", desc = "Toggle Preview", ft = "typst" },
    },
    opts = {
      dependencies_bin = {
        websocat = "websocat",
      },
    },
  },

  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    ---@diagnostic disable: missing-fields
    opts = {
      config = {
        tinymist = {
          settings = {
            formatterMode = "typstyle",
          },
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "ltex-ls-plus" })
    end,
  },
}
