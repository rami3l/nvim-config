---@type LazySpec
return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      if not opts.sources then opts.sources = {} end
      opts.sources = vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.credo.with {
          extra_args = { "--strict" },
        },
      })
      return opts
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("utils").list_remove_all(opts.ensure_installed, { "elixirls" })
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "expert" })
    end,
  },
}
