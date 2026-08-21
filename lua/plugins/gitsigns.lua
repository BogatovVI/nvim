return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signcolumn = true,
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = true,

				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					local keymap = vim.keymap.set

					keymap("n", "]h", function()
						if vim.wo.diff then
							return "]h"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, buffer = bufnr, desc = "Следующее изменение Git" })

					keymap("n", "[h", function()
						if vim.wo.diff then
							return "[h"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, buffer = bufnr, desc = "Предыдущее изменение Git" })

					keymap(
						"n",
						"<leader>hp",
						gs.preview_hunk,
						{ buffer = bufnr, desc = "Превью измененного куска кода" }
					)
					keymap("n", "<leader>hb", function()
						gs.blame_line({ full = true })
					end, {
						buffer = bufnr,
						desc = "Полная информация о коммите строки",
					})
				end,
			})
		end,
	},
}
