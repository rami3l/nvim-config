---@type LazySpec
return {
  -- You can also add new plugins here as well.
  -- For example:

  -- add themes
  "Shatur/neovim-ayu",
  "nyoom-engineering/oxocarbon.nvim",
  "kepano/flexoki-neovim",

  -- configure default light/dark themes
  {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy",
    opts = {
      set_light_mode = function() vim.cmd "colorscheme flexoki-light" end,
      set_dark_mode = function() vim.cmd "colorscheme ayu-mirage" end,
    },
  },

  -- install neovim API helper
  "folke/neodev.nvim",

  -- add other plugins
  {
    "keaising/im-select.nvim",
    event = "User Astrofile",
    config = function(_, opts)
      if vim.fn.has "macunix" == 1 then
        opts.default_im_select = "com.apple.keylayout.US"
        opts.default_command = "macism"
      end
      require("im_select").setup(opts)
    end,
  },

  {
    "Julian/lean.nvim",
    ft = "lean",
    opts = {
      lsp = { on_attach = require("astrolsp").on_attach },
      mappings = true,
    },
  },

  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   event = "User Astrofile",
  --   opts = {
  --     max_lines = 2,
  --   },
  -- },
}
