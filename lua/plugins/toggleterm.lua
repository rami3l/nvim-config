return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<Leader>!", '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal" },
    { "<Leader>t<Enter>", "<Cmd>TermSelect<CR>", desc = "ToggleTerm select" },
  },
  opts = { direction = "float" },
}
