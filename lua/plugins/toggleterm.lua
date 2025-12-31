return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<Leader>!", '<Cmd>execute v:count . "ToggleTerm"<Cr>', desc = "Toggle terminal" },
    { "<Leader>t<Enter>", "<Cmd>TermSelect<Cr>", desc = "ToggleTerm select" },
  },
  opts = { direction = "float" },
}
