return {
  -- You can also add new plugins here as well.
  -- For example:

  -- set the color theme
  "Shatur/neovim-ayu",
  "nyoom-engineering/oxocarbon.nvim",

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
