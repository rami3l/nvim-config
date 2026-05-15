---@type LazySpec
return {
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      name = { "venv", ".venv" },
    },
    keys = {
      { "<Leader>lv", "<Cmd>VenvSelect<Cr>", desc = "Select Venv", ft = "python" },
    },
    specs = {
      { "nvim-telescope/telescope.nvim", enabled = false },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts) opts.mappings.n["<Leader>lv"] = false end,
      },
    },
  },

  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    ---@diagnostic disable: missing-fields
    opts = {
      config = {
        pyrefly = {
          settings = {
            -- https://pyrefly.org/en/docs/IDE/#customization
            python = { pyrefly = {
              typeCheckingMode = "strict",
            } },
          },
        },
      },
    },
  },
}
