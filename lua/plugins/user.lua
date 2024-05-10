---@type LazySpec
return {
  -- Disable bundled plugins.
  { "max397574/better-escape.nvim", enabled = false },

  -- Add new user plugins.

  -- Neovim API helper
  { "folke/neodev.nvim", lazy = true },

  -- UX enhancements
  {
    "mizlan/iswap.nvim",
    event = "VeryLazy",
    keys = {
      { "<Leader>rx", "<CMD>ISwapWith<CR>", desc = "Exchange syntax node" },
      { "<Leader>rX", "<CMD>IMoveWith<CR>", desc = "Shift syntax node" },
    },
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          opts.mappings.n["<Leader>r"] =
            { desc = require("astroui").get_icon("Refactoring", 1, true) .. "Refactor" }
        end,
      },
      { "AstroNvim/astroui", opts = { icons = { Refactoring = "󰣪" } } },
    },
  },

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
    opts = { max_lines = 2 },
  },
}
