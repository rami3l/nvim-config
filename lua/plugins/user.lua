---@type LazySpec
return {
  -- Disable bundled plugins.
  { "max397574/better-escape.nvim", enabled = false },

  -- Add new user plugins.

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
    -- HACK: Works around <https://github.com/williamboman/mason.nvim/issues/392>.
    config = function()
      local astrocore = require("astrocore")
      require("mason-registry"):on(
        "package:install:success",
        vim.schedule_wrap(function(
          pkg --[[@as Package]]
        )
          if pkg.name == "cspell" then
            local plugins = { "@cspell/dict-fr-fr" }

            local base_path =
              vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/cspell/node_modules/cspell")
            for _, plugin in ipairs(plugins) do
              astrocore.notify("Installing cspell plugin `" .. plugin .. "`")
              astrocore.cmd({ "npm", "--prefix", base_path, "install", plugin }, true)
              local ext_path = base_path .. "/node_modules/" .. plugin .. "/cspell-ext.json"
              astrocore.cmd({ "cspell", "link", "add", ext_path }, true)
            end
          end
        end)
      )
    end,
  },
}
