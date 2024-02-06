return {
  "NeogitOrg/neogit",
  keys = {
    { "<Leader>gm", function() require("neogit").open() end, desc = "Neogit dispatch" },
  },
  opts = {
    graph_style = "unicode",
    sections = { recent = { folded = false } },
    signs = {
      -- { CLOSED, OPENED }
      item = { ">", "v" },
      section = { ">", "v" },
    },
    mappings = {
      -- NOTE: `c-` should be lowercase to clash with the default keybinding.
      finder = {
        ["<c-j>"] = "Next",
        ["<c-k>"] = "Previous",
      },
    },
  },
}
