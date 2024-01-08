return {
  -- You can also add new plugins here as well.
  -- For example:

  -- set the color theme
  "nyoom-engineering/oxocarbon.nvim",

  {
    "Shatur/neovim-ayu",
    name = "ayu",
    config = function()
      local ayu = require("ayu")
      local colors = require("ayu.colors")

      local mirage = true
      colors.generate(mirage)

      ayu.setup {
        mirage = mirage,
        overrides = {
          TreesitterContext = {
            bg = colors.selection_inactive,
          },
        },
      }
    end,
  },

  -- add other plugins
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "User Astrofile",
    opts = {
      max_lines = 2,
    },
  },

  {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      lsp = {
        on_attach = require("astronvim.utils.lsp").on_attach,
      },
      mappings = true,
    },
  },
}
