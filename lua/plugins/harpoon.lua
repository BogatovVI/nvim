return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>a", desc = "Добавить файл в Harpoon" },
      { "<leader>m", desc = "Открыть меню Harpoon" },
      { "<leader>1", desc = "Harpoon файл 1" },
      { "<leader>2", desc = "Harpoon файл 2" },
      { "<leader>3", desc = "Harpoon файл 3" },
      { "<leader>4", desc = "Harpoon файл 4" },
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { desc = "Добавить файл в Harpoon" })

      vim.keymap.set("n", "<leader>m", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Открыть меню Harpoon" })

      for i = 1, 4 do
        vim.keymap.set("n", "<leader>" .. i, function()
          harpoon:list():select(i)
        end, { desc = "Harpoon файл " .. i })
      end
    end,
  },
}
