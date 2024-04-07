---@type LazySpec
return {
  -- Disable bundled plugins.
  { "max397574/better-escape.nvim", enabled = false },

  -- Add new user plugins.

  -- Theming
  "Shatur/neovim-ayu",
  "nyoom-engineering/oxocarbon.nvim",
  "kepano/flexoki-neovim",

  {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy",
    opts = {
      set_light_mode = function()
        vim.opt.background = "light"
        vim.cmd("colorscheme astrolight")
      end,
      set_dark_mode = function()
        vim.opt.background = "dark"
        vim.cmd("colorscheme ayu-mirage")
      end,
    },
  },

  -- Neovim API helper
  "folke/neodev.nvim",

  -- Language support
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
