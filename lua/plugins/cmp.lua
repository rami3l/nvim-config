---@type LazySpec
return {
  "saghen/blink.cmp",
  opts = {
    cmdline = {
      keymap = {
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
    },
  },
}
