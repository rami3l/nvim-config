---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    ---@diagnostic disable: missing-fields
    opts = {
      config = {
        zls = {
          settings = {
            zls = {
              enable_build_on_save = true,
            },
          },
        },
      },
    },
  },
}
