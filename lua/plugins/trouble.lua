return {
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Диагностики проекта" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Диагностики файла" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Символы файла" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Location list" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix" },
    },
  },
}
