return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			-- 1. Добавить текущий файл в список Harpoon
			-- Нажимаем Пробел + a (от слова Add)
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
				print("Файл добавлен в Harpoon!")
			end, { desc = "Добавить файл в Harpoon" })

			-- 2. Открыть визуальное меню со списком ваших файлов
			-- Нажимаем Пробел + h (от слова Harpoon)
			vim.keymap.set("n", "<leader>m", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Открыть меню Harpoon" })

			-- Пробел + 1 откроет первый файл, Пробел + 2 — второй и так далее
			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon файл 1" })
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon файл 2" })
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon файл 3" })
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon файл 4" })
		end,
	},
}
