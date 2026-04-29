---@type LazySpec
return {
  {
    "davidmh/mdx.nvim",
    lazy = true,
    event = "BufEnter *.mdx",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "mdx-analyzer",
      })
    end,
  },

  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    ---@diagnostic disable: missing-fields
    opts = {
      config = {
        mdx_analyzer = {
          -- Disable dynamic file watcher registration. The server registers
          -- watchers with the glob `**/*.{mdx}`, and the single-element brace
          -- expansion is invalid in Neovim's glob parser. See:
          -- <https://github.com/saforem2/starter/blob/4f697607fe2b1a375deb5ee08dc231f90cdaff96/lua/plugins/mdx.lua#L6>
          capabilities = {
            workspace = { didChangeWatchedFiles = { dynamicRegistration = false } },
          },
        },
      },
    },
  },
}
