return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<Leader>!", '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal" },
  },
  opts = {
    direction = "float",
  },
}
