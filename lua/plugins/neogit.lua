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
    mappings = {
      -- NOTE: `c-` should be lowercase to clash with the default keybinding.
      finder = {
        ["<c-j>"] = "Next",
        ["<c-k>"] = "Previous",
      },
    },
    ignored_settings = {
      "NeogitPushPopup--force-with-lease",
      "NeogitPushPopup--force",
      "NeogitPullPopup--rebase",
      "NeogitCommitPopup--allow-empty",
      "NeogitCommitPopup--reuse-message",
    },
    integrations = {
      telescope = require("astrocore").is_available("telescope.nvim"),
      diffview = require("astrocore").is_available("diffview.nvim"),
    },
  },
}
