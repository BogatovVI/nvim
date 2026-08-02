return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        map_cr = true, 
      })

      local Rule = require('nvim-autopairs.rule')

      -- Правило для красивых пробелов: {|} -> при нажатии Пробела -> { | }
      autopairs.add_rules({
        Rule(' ', ' ')
          :with_pair(function (opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ '()', '[]', '{}' }, pair)
          end)
      })
    end,
  },
}
