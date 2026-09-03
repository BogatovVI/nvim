return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
      { "fredrikaverpil/neotest-golang", version = "*" },
      "rouge8/neotest-rust",
    },
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Тест под курсором" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Тесты файла" },
      { "<leader>ta", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Все тесты" },
      {
        "<leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug тест под курсором",
      },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Сводка тестов" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Вывод теста" },
    },
    config = function()
      local gotestsum = vim.fn.stdpath("data") .. "/mason/bin/gotestsum"
      local go_runner = vim.fn.executable(gotestsum) == 1 and "gotestsum" or "go"

      require("neotest").setup({
        adapters = {
          require("neotest-golang")({
            runner = go_runner,
          }),
          require("neotest-rust")({
            args = { "--no-capture" },
            dap_adapter = "codelldb",
          }),
        },
      })
    end,
  },
}
