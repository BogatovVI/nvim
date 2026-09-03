return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      disable_filetype = { "snacks_picker_input" },
      map_cr = false,
    },
    config = function(_, opts)
      local autopairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")

      autopairs.setup(opts)
      autopairs.add_rules({
        Rule(" ", " "):with_pair(function(pair_opts)
          local pair = pair_opts.line:sub(pair_opts.col - 1, pair_opts.col)
          return vim.tbl_contains({ "()", "[]", "{}" }, pair)
        end),
      })
    end,
  },
}
