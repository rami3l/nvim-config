return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax

  -- "andweeb/presence.nvim",

  -- {
  --   "Shatur/neovim-ayu",
  --   name = "ayu",
  --   config = function()
  --     require("ayu").setup {
  --       mirage = true,
  --     }
  --   end,
  -- },

  "nyoom-engineering/oxocarbon.nvim",

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
