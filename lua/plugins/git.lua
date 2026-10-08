---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      if vim.fn.executable("gitu") == 1 then
        opts.mappings.n["<Leader>gg"] = {
          function() require("astrocore").toggle_term_cmd { cmd = "gitu", direction = "float" } end,
          desc = "Gitu dispatch",
        }
      end
    end,
  },
}
