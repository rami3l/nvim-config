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
    { "<Leader>?", function() require("snacks.picker").grep() end, desc = "Find words" },
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
  },
}
-- TODO: Find hierarchy UI replacement for `snacks`.
-- {
--   "jmacadie/telescope-hierarchy.nvim",
--   dependencies = {
--     {
--       "AstroNvim/astrolsp",
--       ---@type AstroLSPOpts
--       opts = {
--         mappings = {
--           n = {
--             ["<Leader>lc"] = {
--               "<CMD>Telescope hierarchy outgoing_calls<CR>",
--               desc = "Search outgoing calls",
--             },
--             ["<Leader>lC"] = {
--               "<CMD>Telescope hierarchy incoming_calls<CR>",
--               desc = "Search incoming calls",
--             },
--           },
--         },
--       },
--     },
--   },
--   config = function(plugin, opts)
--     require("astronvim.plugins.configs.telescope")(plugin, opts)
--     require("telescope").load_extension("hierarchy")
--   end,
-- },
