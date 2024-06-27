---@type LazySpec
return {
  "lewis6991/gitsigns.nvim",
  keys = {
    {
      mode = "v",
      "<Leader>gr",
      function() require("gitsigns").reset_hunk { vim.fn.line("."), vim.fn.line("v") } end,
      desc = "Reset Git hunk",
    },
    {
      mode = "v",
      "<Leader>gs",
      function() require("gitsigns").stage_hunk { vim.fn.line("."), vim.fn.line("v") } end,
      desc = "Stage Git hunk",
    },
  },
}
