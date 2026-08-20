return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          icons_enabled = true,
          component_separators = { left = "\u{e0b1}", right = "\u{e0b3}" }, 
          section_separators = { left = "\u{e0b0}", right = "\u{e0b2}" },    
          disabled_filetypes = {
            statusline = { "snacks_dashboard", "snacks_notif_history" },
          },
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "\u{e0b6}", right = "\u{e0b0}" } } },
          lualine_b = { 
            "branch", 
            { "diff", symbols = { added = "\u{f055} ", modified = "\u{f05cb} ", removed = "\u{f0556} " } }
          },
          lualine_c = { { "filename", file_status = true, path = 1 } },
          lualine_x = { 
            { 
              "diagnostics", 
              sources = { "nvim_diagnostic" }, 
              symbols = { error = "\u{f057} ", warn = "\u{f0a92} ", info = "\u{f05a} ", hint = "\u{f0eb} " } 
            }, 
            "encoding", 
            "filetype" 
          },
          lualine_y = { "progress" },
          lualine_z = { { "location", separator = { left = "\u{e0b2}", right = "\u{e0b4}" } } },
        },
      })
    end,
  },
}
