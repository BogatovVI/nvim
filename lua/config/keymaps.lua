local keymap = vim.keymap.set

keymap("i", "jk", function()
  if vim.bo.filetype == "snacks_picker_input" then
    return "jk"
  end
  return "<Esc>"
end, { expr = true, desc = "Выход в нормальный режим" })
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Очистить подсветку поиска" })

keymap("n", "<C-h>", "<C-w>h", { desc = "Окно слева" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Окно снизу" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Окно сверху" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Окно справа" })

keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Сохранить файл" })
keymap("n", "<leader>q", "<cmd>close<CR>", { desc = "Закрыть текущее окно" })

keymap("t", "<Esc>", [[<C-\><C-n>]], { desc = "Выход из terminal mode" })
keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Окно слева" })
keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Окно снизу" })
keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Окно сверху" })
keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Окно справа" })
