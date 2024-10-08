---@type lspconfig.options.tinymist
---@diagnostic disable: missing-fields
return {
  -- HACK: Works around https://github.com/Myriad-Dreamin/tinymist/issues/638.
  -- See https://github.com/Myriad-Dreamin/tinymist/issues/638#issuecomment-2395941103 for more info.
  offset_encoding = "utf-8",
}
