---@type LazySpec
return {
  { import = "astrocommunity.pack.angular" },

  { import = "astrocommunity.pack.full-dadbod" },
  {
    "tpope/vim-dadbod",
    keys = {
      { "<Leader>B", "<Cmd>DBUIToggle<Cr>", desc = "Toggle Dadbod" },
    },
  },
  {
    "Olical/conjure",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = { options = { g = { ["conjure#filetype#sql"] = false } } },
      },
    },
  },

  {
    "folke/sidekick.nvim",
    keys = {
      {
        "<C-.>",
        mode = { "n", "t", "i", "x" },
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle",
      },
      {
        "<Leader>A<Enter>",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle",
      },
      {
        "<Leader>As",
        function() require("sidekick.cli").select { filter = { installed = true } } end,
        desc = "Select CLI",
      },
      {
        "<Leader>Ad",
        function() require("sidekick.cli").close() end,
        desc = "Detach a CLI Session",
      },
      {
        "<Leader>At",
        function() require("sidekick.cli").send { msg = "{this}" } end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<Leader>Af",
        function() require("sidekick.cli").send { msg = "{file}" } end,
        desc = "Send File",
      },
      {
        "<Leader>Av",
        mode = { "x" },
        function() require("sidekick.cli").send { msg = "{selection}" } end,
        desc = "Send Visual Selection",
      },
      {
        "<Leader>Ap",
        mode = { "n", "x" },
        function() require("sidekick.cli").prompt() end,
        desc = "Sidekick Select Prompt",
      },
    },
  },
}
