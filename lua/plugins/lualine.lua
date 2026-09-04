return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons" },
    opts = {
      options = {
        theme = "catppuccin-mocha",
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "snacks_dashboard", "snacks_notif_history" },
        },
      },
      sections = {
        lualine_a = { { "mode", fmt = function(s) return s:sub(1, 1) end } },
        lualine_b = {
          "branch",
          {
            "diff",
            symbols = { added = "+", modified = "~", removed = "-" },
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 1,
            symbols = { modified = "●", readonly = "󰌾", unnamed = "[No Name]" },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = "\u{f015a} ",
              warn = "\u{f002a} ",
              info = "\u{f1035} ",
              hint = "\u{f0336} ",
            },
          },
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
