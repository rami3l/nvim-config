---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts = vim.tbl_deep_extend("force", opts, {
      filesystem = {
        filtered_items = { visible = true },
        group_empty_dirs = true,
        scan_mode = "deep",
      },
    })
    if vim.fn.executable("trash") == 1 then
      opts = vim.tbl_deep_extend("force", opts, {
        filesystem = {
          window = { mappings = { D = "trash" } },
          commands = {
            trash = function(state)
              local inputs = require("neo-tree.ui.inputs")
              local path = state.tree:get_node().path
              local _, name = require("neo-tree.utils").split_path(path)
              local msg = string.format("Are you sure you want to trash '%s'?", name)
              inputs.confirm(msg, function(confirmed)
                if not confirmed then return end
                vim.fn.system { "trash", path }
                require("neo-tree.sources.manager").refresh(state.name)
              end)
            end,
          },
        },
      })
    end
    return opts
  end,
}
