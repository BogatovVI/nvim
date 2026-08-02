return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "alpha", "neo-tree" }, 
          },
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "", right = "" } } }, 
          lualine_b = { 
            "branch", 
            {
              "diff", 
              symbols = { added = " ", modified = " ", removed = " " },
            }
          },
          lualine_c = { 
            { "filename", file_status = true, path = 1 } 
          },
          
          lualine_x = {
            {
              "diagnostics", 
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = "   " },
            },
            "encoding", 
            "filetype"  
          },
          lualine_y = { "progress" }, 
          lualine_z = { { "location", separator = { left = "", right = "" } } }, 
        },
      })
    end,
  },
}
