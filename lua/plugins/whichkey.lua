return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy", 
    opts = {
      preset = "modern", 
      delay = 500,       
      spec = {
        { "<leader>f", group = "Поиск (Telescope)" },
        { "<leader>b", group = "Буферы (Вкладки)" },
        { "<leader>c", group = "Действия LSP" },
        { "<leader>r", group = "Переименование" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Показать все горячие клавиши",
      },
    },
  },
}
