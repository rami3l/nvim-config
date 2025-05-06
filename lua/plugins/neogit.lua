---@type LazySpec
return {
  "NeogitOrg/neogit",
  keys = {
    { "<Leader>gm", function() require("neogit").open() end, desc = "Neogit dispatch" },
  },
  opts = {
    use_per_project_settings = false,
    graph_style = "unicode",
    disable_hint = true,
    disable_signs = true,
    sections = {
      rebase = { folded = false },
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
      "NeogitCommitPopup--allow-empty",
      "NeogitCommitPopup--reuse-message",
      "NeogitPullPopup--rebase",
      "NeogitPushPopup--force",
      "NeogitPushPopup--force-with-lease",
      "NeogitRebasePopup--committer-date-is-author-date",
      "NeogitRebasePopup--ignore-date",
    },
  },
}
