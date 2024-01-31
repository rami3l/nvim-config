return {
  "NeogitOrg/neogit",
  keys = {
    { "<leader>gm", function() require("neogit").open() end, desc = "Neogit dispatch" },
  },
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      mappings = {
        -- NOTE: `c-` should be lowercase to clash with the default keybinding.
        finder = {
          ["<c-j>"] = "Next",
          ["<c-k>"] = "Previous",
        },
      },
    })
  end,
}
