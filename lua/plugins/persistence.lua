return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      need = 1,
      branch = true,
    },
    keys = {
      { "<leader>Ss", function() require("persistence").load() end, desc = "Восстановить сессию" },
      { "<leader>Sl", function() require("persistence").load({ last = true }) end, desc = "Последняя сессия" },
      { "<leader>SS", function() require("persistence").select() end, desc = "Выбрать сессию" },
    },
  },
}
