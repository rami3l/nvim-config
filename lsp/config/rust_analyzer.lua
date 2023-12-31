return {
  -- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/rust/README.md
  settings = {
    -- Add clippy lints for Rust.
    checkOnSave = {
      allFeatures = true,
      command = "clippy",
      extraArgs = { "--no-deps" },
    },
  },
}
