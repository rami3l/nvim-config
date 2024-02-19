return {
  "windwp/nvim-autopairs",
  config = function(_, opts)
    local nap = require("nvim-autopairs")
    nap.setup(opts)
    if not require("astrocore").config.features.autopairs then nap.disable() end
  end,
  opts = { enable_check_bracket_line = true },
}
