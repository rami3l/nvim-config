-- set vim options here (vim.<first_key>.<second_key> = value)
return {
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
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
