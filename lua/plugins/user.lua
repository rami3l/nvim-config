local list_insert_unique = require("astrocore").list_insert_unique

---@type LazySpec
return {
  -- Disable bundled plugins.
  { "max397574/better-escape.nvim", enabled = false },

  -- Add new user plugins.

  -- Themes
  "Shatur/neovim-ayu",
  "nyoom-engineering/oxocarbon.nvim",
  "kepano/flexoki-neovim",
  {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy",
    opts = {
      set_light_mode = function() vim.cmd("colorscheme astrolight") end,
      set_dark_mode = function() vim.cmd("colorscheme ayu-mirage") end,
    },
  },

  -- Neovim API helper
  "folke/neodev.nvim",

  -- Misc
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
    "WillEhrendreich/Ionide-Nvim",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = function(_, opts)
          opts.ensure_installed = list_insert_unique(opts.ensure_installed, "fsautocomplete")
        end,
      },
      {
        "jay-babu/mason-null-ls.nvim",
        opts = function(_, opts)
          opts.ensure_installed = list_insert_unique(opts.ensure_installed, "fantomas")
        end,
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

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "User Astrofile",
    opts = {
      max_lines = 2,
    },
  },
}
