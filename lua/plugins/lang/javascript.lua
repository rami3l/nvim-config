---@type LazySpec
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = (function()
        local prettier = {
          "prettierd",
          "prettier",
          "oxfmt",
          stop_after_first = true,
          lsp_format = "fallback",
        }
        return {
          astro = prettier,
          css = prettier,
          html = prettier,
          javascript = prettier,
          javascriptreact = prettier,
          json = prettier,
          json5 = prettier,
          jsonc = prettier,
          markdown = prettier,
          ["markdown.mdx"] = prettier,
          svelte = prettier,
          typescript = prettier,
          typescriptreact = prettier,
          vue = prettier,
          yaml = prettier,
        }
      end)(),
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        { "oxfmt", "js-debug-adapter" }
      )
    end,
  },
}
