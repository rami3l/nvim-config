-- AstroCore allows you easy access to customize the default options provided in AstroNvim
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
      opt = {
        -- set to true or false etc.
        relativenumber = true,
        number = true,
        signcolumn = "yes", -- set to "auto" to save space when no info is shown on the right of line numbers
        wrap = true,
        termguicolors = true, -- enable rich text
        clipboard = "", -- set to "unnamedplus" to link to the system clipboard
        spell = false,
        spelllang = "en,fr,cjk", -- enable spell checker
        spelloptions = "camel",
      },
      g = {
        mapleader = " ",
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        -- icons_enabled = false, -- disable icons in the UI (disable if no nerd font is available, requires restart after changing)
        autopairs_enabled = true, -- enable autopairs at start
        inlay_hints_enabled = true, -- enable or disable LSP inlay hints on startup (Neovim v0.10 only)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
      },
    },

    mappings = require("plugins.core.mappings"),
  },
}
