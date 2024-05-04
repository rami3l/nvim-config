---@type LazySpec
return {
  "mrjones2014/smart-splits.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local n = opts.mappings.n
        n["<CA-Up>"] = { require("smart-splits").resize_up, desc = "Resize split up" }
        n["<CA-Down>"] = { require("smart-splits").resize_down, desc = "Resize split down" }
        n["<CA-Left>"] = { require("smart-splits").resize_left, desc = "Resize split left" }
        n["<CA-Right>"] = { require("smart-splits").resize_right, desc = "Resize split right" }

        ---@param direction "up"|"down"|"left"|"right"
        ---@return fun(): nil
        local function smart_splits_swap_buf_and_focus(direction)
          local smart_splits = require("smart-splits")
          return function()
            smart_splits["swap_buf_" .. direction]()
            smart_splits["move_cursor_" .. direction]()
          end
        end

        n["<C-w><C-k>"] = { smart_splits_swap_buf_and_focus("up"), desc = "Swap split up" }
        n["<C-w><C-j>"] = { smart_splits_swap_buf_and_focus("down"), desc = "Swap split down" }
        n["<C-w><C-h>"] = { smart_splits_swap_buf_and_focus("left"), desc = "Swap split left" }
        n["<C-w><C-l>"] = { smart_splits_swap_buf_and_focus("right"), desc = "Swap split right" }
      end,
    },
  },
}
