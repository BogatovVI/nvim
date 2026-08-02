return {
  {
    "folke/trouble.nvim",
    opts = {}, -- Использовать стандартные настройки оформления
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Ошибки проекта (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Ошибки текущего файла (Trouble)" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Структура файла / Символы (Trouble)" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
    },
  },
}
