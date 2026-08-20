local telescope_layout = {
  preset = "default",
  layout = {
    box = "horizontal",
    width = 0.8,
    height = 0.8,
    { box = "vertical", border = "rounded", title = "{title} {opts}", { win = "input", height = 1, border = "bottom" }, { win = "list" } },
    { win = "preview",  title = "{preview}", border = "rounded", width = 0.55 },
  },
}

local my_logo = {
  " ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝ ██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝  ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝   ╚═╝╚═╝     ╚═╝ ",
  " ",
}

-- Умная функция вызова проводника: защищает дашборд от сдвигов
local function smart_explorer()
  if vim.bo.filetype == "snacks_dashboard" then
    -- Если мы на стартовом экране, не ломаем его сайдбаром, а сразу предлагаем открыть файл
    Snacks.picker.files()
  else
    -- Во всех остальных случаях открываем классический сайдбар
    Snacks.explorer()
  end
end

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = { 
        enabled = true,
        sources = {
          select = {
            preview = false,
            layout = { preset = "select", width = 0.4, height = 0.3 }
          },
          
          -- Настоящий красивый сайдбар, который двигает код и не перекрывает его
          explorer = {
            focus = "list",
            layout = {
              preset = "sidebar",
              preview = false,   
              layout = {
                position = "left",
                width = 32,       
              }
            },
            win = { 
              list = {
                keys = {
                  ["/"] = "focus_input",
                },
              },
              input = {
                keys = {
                  ["<Esc>"] = { "focus_list", mode = { "i", "n" } },
                },
              },
            },
          },
          
          files = { layout = telescope_layout },
          grep = { layout = telescope_layout },
          buffers = { layout = telescope_layout },
          help = { layout = telescope_layout },
          git_status = { layout = telescope_layout },
          diagnostics = { layout = telescope_layout },
          lsp_symbols = { layout = telescope_layout },
        },
        win = {
          input = {
            keys = {
              ["<C-j>"] = { "list_down", mode = { "i", "n" } },
              ["<C-k>"] = { "list_up",   mode = { "i", "n" } },
            }
          }
        }
      },
      
      explorer = { enabled = true },
      
      dashboard = {
        enabled = true,
        sections = {
          { section = "header", text = my_logo, align = "center", padding = 1 },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
        preset = {
          keys = {
            { icon = "\u{f002} ",  key = "f", desc = "Поиск файлов", action = ":lua Snacks.picker.files()" },
            { icon = "\u{f0a35} ", key = "g", desc = "Поиск текста", action = ":lua Snacks.picker.grep()" },
            { icon = "\u{f015b} ", key = "n", desc = "Создать новый файл", action = ":ene | startinsert" },
            -- ИСПРАВЛЕНО: Кнопка на Dashboard теперь вызывает нашу безопасную умную функцию
            { icon = "\u{f01c3} ", key = "e", desc = "Проводник файлов", action = ":lua --[[ Нажмите 'f' или выберите файл ]] Snacks.picker.files()" },
            { icon = "\u{f4b2} ",  key = "l", desc = "Пакетный менеджер Lazy", action = ":Lazy" },
            { icon = "\u{f1322} ", key = "m", desc = "Инструменты Mason", action = ":Mason" },
            { icon = "\u{f08b} ",  key = "q", desc = "Выйти из Neovim", action = ":qa" },
          },
        },
      },
      
      notifier = { enabled = true },
      indent = { enabled = true },
      scroll = { enabled = true },
    },
    keys = {
      -- ИСПРАВЛЕНО: Горячая клавиша теперь тоже использует умную функцию
      { '<leader>e',  smart_explorer, desc = "Проводник файлов" },
      
      { '<leader>ff', function() Snacks.picker.files() end, desc = "Поиск файлов по имени" },
      { '<leader>fg', function() Snacks.picker.grep() end, desc = "Поиск текста по всему проекту" },
      { '<leader>fb', function() Snacks.picker.buffers() end, desc = "Поиск по открытым буферам" },
      { '<leader>fh', function() Snacks.picker.help() end, desc = "Поиск по справке Neovim" },
      { '<leader>gs', function() Snacks.picker.git_status() end, desc = "Git статус проекта" },
      { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = "Поиск ошибок (Diagnostics)" },
      { '<leader>ss', function() Snacks.picker.lsp_symbols() end, desc = "Структура файла (Функции/Классы)" },
      { '<leader>bd', function() Snacks.bufdelete() end, desc = "Закрыть текущий буфер" },
    },
  }
}
