return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, 
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                                                           ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║       ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║       ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║       ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║       ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝       ",
        "                                                           ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "    Поиск файлов", "<cmd>Telescope find_files<CR>"),
        dashboard.button("g", "    Поиск текста", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("n", "    Создать новый файл", "<cmd>ene <BAR> startinsert <CR>"),
        dashboard.button("e", "    Проводник (Neo-tree)", "<cmd>Neotree toggle left<CR>"),
        dashboard.button("l", "    Пакетный менеджер Lazy", "<cmd>Lazy<CR>"),
        dashboard.button("m", "    Инструменты Mason", "<cmd>Mason<CR>"),
        dashboard.button("q", "    Выйти из Neovim", "<cmd>qa<CR>"),
      }

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim загрузился за " .. ms .. " мс со " .. stats.count .. " плагинами"
          pcall(vim.cmd, "AlphaRedraw")
        end,
      })

      alpha.setup(dashboard.opts)
    end,
  },
}
