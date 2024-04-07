-- Customization of mason plugins
local list_insert_unique = require("astrocore").list_insert_unique

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = list_insert_unique(opts.ensure_installed, { "lua_ls" })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      { "davidmh/cspell.nvim", lazy = true },
    },
    opts = function(_, opts)
      local nls = require("null-ls")

      opts.ensure_installed = list_insert_unique(opts.ensure_installed, { "cspell" })

      local cspell_cfg = { config_file_preferred_name = ".cspell.json" }

      opts.handlers.cspell = function()
        local cspell = require("cspell")
        nls.register {
          cspell.code_actions.with { config = cspell_cfg },
          cspell.diagnostics.with {
            config = cspell_cfg,
            -- https://github.com/davidmh/cspell.nvim/issues/13
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity["INFO"]
            end,
          },
        }
      end

      opts.handlers.clang_format = function()
        nls.register {
          nls.builtins.formatting.clang_format.with {
            disabled_filetypes = { "java" },
          },
        }
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- opts = function(_, opts)
    -- opts.ensure_installed = list_insert_unique(opts.ensure_installed, {})
    -- end,
  },
}
