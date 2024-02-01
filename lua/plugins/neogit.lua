return {
  "NeogitOrg/neogit",
  keys = {
    { "<leader>gm", function() require("neogit").open() end, desc = "Neogit dispatch" },
  },
  opts = {
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
