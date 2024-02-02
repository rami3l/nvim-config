-- Example customization of mason plugins
---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, "lua_ls")
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      { "davidmh/cspell.nvim", lazy = true },
    },
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, "cspell")

      opts.handlers.cspell = function()
        local cspell = require("cspell")
        require("null-ls").register {
          cspell.code_actions,
          cspell.diagnostics.with {
            -- https://github.com/davidmh/cspell.nvim/issues/13
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity["INFO"]
            end,
          },
        }
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed)
    end,
  },
}
