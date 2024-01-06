return {
  "NeogitOrg/neogit",
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      mappings = {
        finder = {
          ["<C-j>"] = "Next",
          ["<C-k>"] = "Previous",
        },
      },
    })
  end,
}
