---@type LazySpec
return {
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    specs = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          opts.mappings.n["<Leader>d<Enter>"] = {
            function() require("dapui").toggle() end,
            desc = "Toggle Debugger UI",
          }
        end,
      },
    },
  },
}
