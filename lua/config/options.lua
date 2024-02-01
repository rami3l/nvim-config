-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/options.lua
-- Add any additional options here

local options = {
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
}

for scope, table in pairs(options) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end
