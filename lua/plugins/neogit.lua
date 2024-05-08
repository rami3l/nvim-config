---@type LazySpec
return {
  "NeogitOrg/neogit",
  branch = "nightly",
  keys = {
    { "<Leader>gm", function() require("neogit").open() end, desc = "Neogit dispatch" },
  },
  opts = {
    graph_style = "unicode",
    disable_signs = true,
    sections = {
      rebase = { folded = false },
      recent = { folded = false },
    },
    mappings = {
      -- NOTE: `c-` should be lowercase to clash with the default keybinding.
      finder = {
        ["<c-j>"] = "Next",
        ["<c-k>"] = "Previous",
      },
    },
    ignored_settings = {
      "NeogitCommitPopup--reuse-message",
    },
  },
}
