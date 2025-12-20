---@type LazySpec
return {
  -- Disable bundled plugins.
  { "max397574/better-escape.nvim", enabled = false },

  -- Add new user plugins below.

  -- UX enhancements
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "User AstroFile",
    opts = {
      keymaps = {
        useDefaults = true,
        -- NOTE: Avoids conflicts with Vim's "format" functionality.
        -- It seems that `gw` is preferred over `gq` now.
        -- See: <https://www.douglasdrumond.tech/post/2024-11-04-g-format>
        disabledDefaults = { "gw", "gW" },
      },
    },
  },

  {
    "mizlan/iswap.nvim",
    event = "VeryLazy",
    keys = {
      { "<Leader>rx", "<CMD>ISwapWith<CR>", desc = "Exchange syntax node" },
      { "<Leader>rX", "<CMD>IMoveWith<CR>", desc = "Shift syntax node" },
    },
    specs = {
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
    event = "User AstroFile",
    opts = function(_, opts)
      if vim.fn.has("macunix") == 1 then
        opts.default_im_select = "com.apple.keylayout.US"
        if vim.fn.executable("macism") == 1 then opts.default_command = "macism" end
      end
    end,
  },
}
