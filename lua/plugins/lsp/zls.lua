---@type lspconfig.options.zls
---@diagnostic disable: missing-fields
return {
  settings = {
    zls = {
      enable_build_on_save = true,
      build_on_save_step = "check",
    },
  },
}
