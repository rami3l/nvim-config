-- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md

---@type LazySpec
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {},
  keys = {
    { "gL", function() require("snacks.picker").diagnostics() end, desc = "Search diagnostics" },
    ---@diagnostic disable-next-line: undefined-field
    { "g?", function() require("snacks.picker").todo_comments() end, desc = "Search todos" },
    {
      "<Leader>/",
      function() require("snacks.picker").lines() end,
      desc = "Find words in buffer",
    },
    {
      "<Leader>?",
      function() require("snacks.picker").grep { hidden = true } end,
      desc = "Find words",
    },
    {
      "<Leader>`",
      function() require("snacks.picker").files { hidden = true } end,
      desc = "Find files",
    },
    {
      "<Leader>~",
      function() require("snacks.picker").files { hidden = true, ignored = true } end,
      desc = "Find all files",
    },
    {
      "<Leader>lc",
      function() require("snacks.picker").lsp_outgoing_calls() end,
      desc = "Find outgoing calls",
    },
    {
      "<Leader>lC",
      function() require("snacks.picker").lsp_incoming_calls() end,
      desc = "Find incoming calls",
    },
  },
}
