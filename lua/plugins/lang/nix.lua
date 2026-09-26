---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    ---@diagnostic disable: missing-fields
    opts = {
      config = {
        nixd = {
          settings = {
            nixd = { formatting = {
              command = { "alejandra" },
            } },
          },
        },
      },
    },
  },
}
