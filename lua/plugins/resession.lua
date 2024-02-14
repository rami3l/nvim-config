return {
  "stevearc/resession.nvim",
  keys = {
    -- https://github.com/stevearc/resession.nvim/tree/master?tab=readme-ov-file#api
    {
      "<Leader>SD",
      function() require("resession").delete(nil, { dir = "dirsession" }) end,
      desc = "Delete a dirsession",
    },
  },
}
