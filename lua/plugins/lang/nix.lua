---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "nil", "alejandra" })
    end,
  },

  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    ---@diagnostic disable: missing-fields
    opts = {
      config = {
        ["nil_ls"] = {
          settings = {
            ["nil"] = { formatting = {
              command = { "alejandra" },
            } },
          },
        },
      },
    },
  },
}
