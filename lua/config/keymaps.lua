-- Путь: lua/config/keymaps.lua
local keymap = vim.keymap.set

-- 1. Выход из режима вставки (вместо дальней кнопки Esc)
keymap("i", "jk", "<Esc>", { desc = "Выход в нормальный режим" })

-- 2. Сброс подсветки поиска по нажатию Esc
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Очистить подсветку поиска" })

-- 3. Навигация между сплитами (окнами)
keymap("n", "<C-h>", "<C-w>h", { desc = "Окно слева" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Окно снизу" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Окно сверху" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Окно справа" })

-- 5. Быстрое сохранение файла
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Сохранить файл" })

-- 7. Закрыть текущее сплит-окно по нажатию Пробел + q
keymap("n", "<leader>q", "<cmd>close<CR>", { desc = "Закрыть текущее окно (сплит)" })

-- Переключение на следующую вкладку (буфер)
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
-- Переключение на предыдущую вкладку (буфер)
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { silent = true, desc = "Previous buffer" })
