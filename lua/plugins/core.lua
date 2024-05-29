---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure AstroNvim features
    features = {
      large_buf = { size = 1024 * 100, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },

    -- Configure Neovim options
    -- Default options that are always set: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/options.lua
    options = {
      -- Global vim options (`vim.opt`)
      opt = {
        -- set to true or false etc.
        relativenumber = true,
        number = true,
        signcolumn = "yes",
        wrap = true,
        termguicolors = true, -- enable rich text
        clipboard = "", -- set to "unnamedplus" to link to the system clipboard
        spell = false,
        spelllang = "en,fr,cjk",
        spelloptions = "camel",
      },
      -- Global vim variables (`vim.g`)
      g = {},
    },

    mappings = require("plugins.core.mappings"),
  },
}
