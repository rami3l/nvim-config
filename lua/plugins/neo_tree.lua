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
      local function trash(get_msg_and_paths)
        return function(state, ...)
          local msg, paths = get_msg_and_paths(state, ...)
          require("neo-tree.ui.inputs").confirm(msg, function(confirmed)
            if not confirmed then return end
            vim.fn.system(vim.list_extend({ "trash" }, paths))
            require("neo-tree.sources.manager").refresh(state.name)
          end)
        end
      end
      opts = vim.tbl_deep_extend("force", opts, {
        filesystem = {
          window = { mappings = { D = "trash" } },
          commands = {
            trash = trash(function(state)
              local path = state.tree:get_node().path
              local _, name = require("neo-tree.utils").split_path(path)
              local msg = string.format("Are you sure you want to trash '%s'?", name)
              return msg, { path }
            end),
            trash_visual = trash(function(_, nodes)
              local paths = {}
              for _, node in pairs(nodes) do
                table.insert(paths, node.path)
              end
              local msg = string.format("Are you sure you want to trash %i items?", #paths)
              return msg, paths
            end),
          },
        },
      })
    end
    return opts
  end,
}
