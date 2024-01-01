return {
  -- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
  settings = {
    ["rust-analyzer"] = {
      completion = {
        callable = { snippets = "add_parentheses" },
      },
      check = { command = "clippy" },
      imports = {
        granularity = { enforce = true },
        prefix = "self",
      },
      inlayHints = {
        closureReturnTypeHints = { enable = "with_block" },
        lifetimeElisionHints = { enable = "skip_trivial", useParameterNames = true },
        typeHints = { hideClosureInitialization = true },
      },
      procMacro = { enable = true },
      rustfmt = { extraArgs = { "+nightly" } },
    },
  },
}
