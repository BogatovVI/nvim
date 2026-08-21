local telescope_layout = {
	preset = "default",
	layout = {
		box = "horizontal",
		width = 0.8,
		height = 0.8,
		{
			box = "vertical",
			border = "rounded",
			title = "{title} {opts}",
			{ win = "input", height = 1, border = "bottom" },
			{ win = "list" },
		},
		{ win = "preview", title = "{preview}", border = "rounded", width = 0.55 },
	},
}

local my_logo = {
	"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
	"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
	"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝ ██║██║╚██╔╝██║",
	"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝  ██║██║ ╚═╝ ██║",
	"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝   ╚═╝╚═╝     ╚═╝",
}

local function smart_explorer()
	if vim.bo.filetype == "snacks_dashboard" then
		Snacks.picker.files()
	else
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
						layout = { preset = "select", width = 0.4, height = 0.3 },
					},
					explorer = {
						layout = telescope_layout,
						-- 🛠️ РЕШЕНИЕ: Автоматически закрывать окно проводника после выбора файла
						auto_close = true,
						win = {
							list = {
								keys = {
									["/"] = "focus_input",
									["l"] = "none",
									["h"] = "none",
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
							["<C-k>"] = { "list_up", mode = { "i", "n" } },
						},
					},
				},
			},
			explorer = { enabled = true },
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header", text = my_logo, align = "center", padding = 1 },
					{ section = "keys", gap = 1, padding = 1, align = "center" },
					{ section = "startup", padding = 1 },
				},
				preset = {
					keys = {
						{
							icon = "\u{f002} ",
							key = "f",
							desc = "Find files          ",
							action = ":lua Snacks.picker.files()",
						},
						{
							icon = "\u{f0a35} ",
							key = "g",
							desc = "Grep text           ",
							action = ":lua Snacks.picker.grep()",
						},
						{
							icon = "\u{f015b} ",
							key = "n",
							desc = "New file            ",
							action = ":ene | startinsert",
						},
						{
							icon = "\u{f01c3} ",
							key = "e",
							desc = "File explorer       ",
							action = ":lua Snacks.explorer()",
						},
						{ icon = "\u{f135} ", key = "l", desc = "Lazy plugin manager ", action = ":Lazy" },
						{ icon = "\u{f085} ", key = "m", desc = "Mason tools manager ", action = ":Mason" },
						{ icon = "\u{f08b} ", key = "q", desc = "Quit Neovim         ", action = ":qa" },
					},
				},
			},
			notifier = { enabled = true },
			indent = { enabled = true },
			scroll = { enabled = true },
		},
		config = function(_, opts)
			require("snacks").setup(opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "snacks_dashboard",
				callback = function()
					vim.opt_local.cursorline = true
				end,
			})
		end,
		keys = {
			{ "<leader>e", smart_explorer, desc = "File explorer" },
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find files by name",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Find text globally",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Find in open buffers",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.help()
				end,
				desc = "Search Neovim help",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git project status",
			},
			{
				"<leader>sd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Search diagnostics",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "File structure (LSP)",
			},
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete current buffer",
			},
			{
				"<leader>bc",
				function()
					Snacks.bufdelete.other()
				end,
				desc = "Delete other buffers",
			},
			{
				"<leader>bX",
				function()
					Snacks.bufdelete.all()
				end,
				desc = "Delete all buffers",
			},
		},
	},
}
