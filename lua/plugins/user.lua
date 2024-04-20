---@type LazySpec
return {
  -- Disable bundled plugins.
  { "max397574/better-escape.nvim", enabled = false },

  -- Add new user plugins.

  -- Neovim API helper
  { "folke/neodev.nvim", lazy = true },

  -- Language support
  "beardedsakimonkey/nvim-antifennel",
  {
    "gpanders/nvim-parinfer",
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            parinfer_force_balance = true,
            parinfer_comment_chars = ";;",
          },
        },
      },
    },
  },

  {
    "Julian/lean.nvim",
    ft = "lean",
    opts = {
      lsp = { on_attach = require("astrolsp").on_attach },
      mappings = true,
    },
  },

  -- UI enhancements
  {
    "keaising/im-select.nvim",
    event = "User Astrofile",
    config = function(_, opts)
      if vim.fn.has("macunix") == 1 then
        opts.default_im_select = "com.apple.keylayout.US"
        opts.default_command = "macism"
      end
      require("im_select").setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "User Astrofile",
    opts = {
      max_lines = 2,
    },
  },
}
