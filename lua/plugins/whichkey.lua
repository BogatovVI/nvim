return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 500,
      spec = {
        { "<leader>f", group = "Поиск" },
        { "<leader>b", group = "Буферы" },
        { "<leader>c", group = "Код" },
        { "<leader>d", group = "Отладка" },
        { "<leader>g", group = "Git" },
        { "<leader>h", group = "Hunks / Harpoon" },
        { "<leader>i", group = "Inlay hints" },
        { "<leader>r", group = "Запуск" },
        { "<leader>s", group = "LSP / поиск" },
        { "<leader>S", group = "Сессия" },
        { "<leader>t", group = "Тесты" },
        { "<leader>x", group = "Диагностики" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Показать горячие клавиши",
      },
    },
  },
}
