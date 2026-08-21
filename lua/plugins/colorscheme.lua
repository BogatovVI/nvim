return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				-- Cтиль: "storm", "moon", "night" или "day"
				style = "night",
				transparent = false,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
				},
			})

			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
