-- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
---@type lspconfig.options.rust_analyzer
---@diagnostic disable: missing-fields
return {
  settings = {
    ["rust-analyzer"] = {
      cargo = { features = "all" },
      check = { command = "clippy" },
      completion = {
        postfix = { enable = true },
      },
      imports = {
        granularity = { enforce = true },
        prefix = "self",
      },
      inlayHints = {
        closureReturnTypeHints = { enable = "with_block" },
        expressionAdjustmentHints = { enable = "reborrow" },
        lifetimeElisionHints = { enable = "skip_trivial", useParameterNames = true },
        typeHints = { hideClosureInitialization = true },
      },
      procMacro = { enable = true },
      rustfmt = { extraArgs = { "+nightly" } },
      workspace = {
        symbol = {
          search = {
            kind = "all_symbols",
            limit = 512,
          },
        },
      },
    },
  },
}
