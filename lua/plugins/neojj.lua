---@type LazySpec
return {
  "NicholasZolton/neojj",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<Leader>gm", function() require("neojj").open() end, desc = "Neojj dispatch" },
  },
  opts = {
    use_per_project_settings = false,
    graph_style = "unicode",
    disable_hint = true,
    disable_signs = true,
    sections = {
      recent = { folded = false },
    },
    commit_editor = {
      spell_check = false,
    },
    mappings = {
      -- NOTE: `c-` should be lowercase to clash with the default keybinding.
      finder = {
        ["<c-j>"] = "Next",
        ["<c-k>"] = "Previous",
      },
    },
    ignored_settings = {
      "NeojjBookmarkPopup--allow-backwards",
      "NeojjCommitPopup--interactive",
      "NeojjPushPopup--deleted",
      "NeojjPushPopup--dry-run",
      "NeojjPushPopup--remote",
      "NeojjSquashPopup--interactive",
    },
  },
}
