---@type LazySpec
return {
  "davidmh/cspell.nvim",
  lazy = true,
  dependencies = {
    {
      "jay-babu/mason-null-ls.nvim",
      opts = function(_, opts)
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "cspell" })
        local cspell_cfg = { config_file_preferred_name = ".cspell.json" }
        opts.handlers.cspell = function()
          require("null-ls").register {
            require("cspell").code_actions.with { config = cspell_cfg },
            require("cspell").diagnostics.with {
              config = cspell_cfg,
              -- https://github.com/davidmh/cspell.nvim/issues/13
              diagnostics_postprocess = function(diagnostic)
                diagnostic.severity = vim.diagnostic.severity["INFO"]
              end,
            },
          }
        end
      end,
    },
  },
  -- HACK: Works around <https://github.com/williamboman/mason.nvim/issues/392>.
  config = function()
    local astrocore = require("astrocore")
    require("mason-registry"):on(
      "package:install:success",
      vim.schedule_wrap(function(
        pkg --[[@as Package]]
      )
        if pkg.name == "cspell" then
          local plugins = { "@cspell/dict-fr-fr" }

          local base_path =
            vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/cspell/node_modules/cspell")
          for _, plugin in ipairs(plugins) do
            astrocore.notify("Installing cspell plugin `" .. plugin .. "`")
            vim.system({ "npm", "--prefix", base_path, "install", plugin }, nil, function(_)
              astrocore.notify("Installed cspell plugin `" .. plugin .. "`")
              local ext_path = base_path .. "/node_modules/" .. plugin .. "/cspell-ext.json"
              vim.system(
                { "cspell", "link", "add", ext_path },
                nil,
                function(_) astrocore.notify("Linked cspell plugin `" .. plugin .. "`") end
              )
            end)
          end
        end
      end)
    )
  end,
}
