return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  {
    "Shatur/neovim-ayu",
    name = "ayu",
    config = function()
      require("ayu").setup {
        mirage = true,
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    -- Use for stability; omit to use `main` branch for the latest features
    -- version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end
  },
}
