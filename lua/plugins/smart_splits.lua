---@type LazySpec
return {
  "mrjones2014/smart-splits.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local n = opts.mappings.n

        local smart_splits = require("smart-splits")

        n["<A-k>"] = { smart_splits.resize_up, desc = "Resize split up" }
        n["<A-j>"] = { smart_splits.resize_down, desc = "Resize split down" }
        n["<A-h>"] = { smart_splits.resize_left, desc = "Resize split left" }
        n["<A-l>"] = { smart_splits.resize_right, desc = "Resize split right" }

        -- By default, <C-w>(HJKL) will move the split to the far left, bottom, top or right respectively.
        -- The following snippet also enables the split to swap places with a neighbor.

        ---@param direction "up"|"down"|"left"|"right"
        local function swap_split_entry(direction)
          return {
            function()
              smart_splits["swap_buf_" .. direction]()
              smart_splits["move_cursor_" .. direction]()
            end,
            desc = "Swap split " .. direction,
          }
        end

        local swap_split_up = swap_split_entry("up")
        local swap_split_down = swap_split_entry("down")
        local swap_split_left = swap_split_entry("left")
        local swap_split_right = swap_split_entry("right")

        n["<C-w>S"] = { desc = "Swap split" }
        n["<CA-k>"], n["<C-w>Sk"] = swap_split_up, swap_split_up
        n["<CA-j>"], n["<C-w>Sj"] = swap_split_down, swap_split_down
        n["<CA-h>"], n["<C-w>Sh"] = swap_split_left, swap_split_left
        n["<CA-l>"], n["<C-w>Sl"] = swap_split_right, swap_split_right
      end,
    },
  },
}
