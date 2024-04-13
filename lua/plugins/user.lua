---@type LazySpec
return {
  -- Disable bundled plugins.
  { "max397574/better-escape.nvim", enabled = false },

  -- Add new user plugins.

  -- Theming
  { "Shatur/neovim-ayu", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  { "kepano/flexoki-neovim", lazy = true },

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
  { "folke/neodev.nvim", lazy = true },

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

  -- Misc
  {
    "davidmh/cspell.nvim",
    lazy = true,
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",

        opts = function(_, opts)
          opts.ensure_installed =
            require("astrocore").list_insert_unique(opts.ensure_installed, { "cspell" })

          local cspell_cfg = { config_file_preferred_name = ".cspell.json" }

          opts.handlers.cspell = function()
            require("null-ls").register {
              require("cspell").code_actions.with { config = cspell_cfg },
              require("cspell").diagnostics.with {
                config = cspell_cfg,
                -- https://github.com/davidmh/cspell.nvim/issues/13
                diagnostics_postprocess = function(diagnostic)
                  diagnostic.severity = vim.diagnostic.severity["INFO"]
                end,
              },
            }
          end
        end,
      },
    },
  },
}
