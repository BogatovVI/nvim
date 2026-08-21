return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		opts = {
			options = {
				mode = "buffers",
				separator_style = { "", "" },
				show_buffer_close_icons = false,
				show_close_icon = false,
				themable = true,
				always_show_bufferline = false,
				auto_toggle = true,
				disabled_filetypes = { "snacks_dashboard", "dashboard", "alpha" },
				indicator = {
					style = "underline",
				},
			},
			highlights = {
				fill = { bg = "none" },
				background = { bg = "none" },
				buffer_visible = { bg = "none" },
				buffer_selected = { bg = "none", bold = true },
				separator = { bg = "none", fg = "none" },
				separator_visible = { bg = "none", fg = "none" },
				separator_selected = { bg = "none", fg = "none" },
				indicator_selected = {
					link = "Keyword",
				},
				indicator_visible = {
					bg = "none",
					fg = "none",
				},
			},
		},
	},
}
