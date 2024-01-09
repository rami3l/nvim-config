return {
  -- You can also add new plugins here as well.
  -- For example:

  -- set the color theme
  "Shatur/neovim-ayu",
  "nyoom-engineering/oxocarbon.nvim",

  -- add other plugins
  {
    "keaising/im-select.nvim",
    event = "User Astrofile",
    config = function(_, opts)
      if vim.fn.has("macunix") == 1 then
        opts.default_command = "macism"
        opts.default_im_select = "com.apple.keylayout.US"
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
