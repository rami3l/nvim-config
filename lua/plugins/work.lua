---@type LazySpec
return {
  { import = "astrocommunity.pack.angular" },

  {
    "kndndrj/nvim-dbee",
    dependencies = { "MunifTanjim/nui.nvim" },
    build = function() require("dbee").install() end,
    opts = {
      drawer = {
        mappings = {
          -- Refreshes the drawer.
          { key = "R", mode = "n", action = "refresh" },
          -- Opens a note or executes a helper.
          { key = "<CR>", mode = "n", action = "action_1" },
          -- Renames a note or sets the connection as active.
          { key = "C", mode = "n", action = "action_2" },
          { key = "cc", mode = "n", action = "action_2" },
          -- Deletes a note or connection.
          { key = "dd", mode = "n", action = "action_3" },
          -- Toggles a tree node.
          { key = "<Tab>", mode = "n", action = "toggle" },
          -- Handles menu popups.
          { key = "<CR>", mode = "n", action = "menu_confirm" },
          { key = "y", mode = "n", action = "menu_yank" },
          { key = "<Esc>", mode = "n", action = "menu_close" },
          { key = "q", mode = "n", action = "menu_close" },
        },
      },
    },
    keys = {
      { "<Leader>B", function() require("dbee").toggle() end, desc = "Toggle DBee" },
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
