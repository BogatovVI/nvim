return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "echasnovski/mini.icons" },
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Следующий буфер" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Предыдущий буфер" },
      { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Pin буфер" },
    },
    opts = {
      options = {
        mode = "buffers",
        themable = true,
        numbers = "none",
        close_command = function(n)
          require("snacks").bufdelete(n)
        end,
        right_mouse_command = function(n)
          require("snacks").bufdelete(n)
        end,
        middle_mouse_command = function(n)
          require("snacks").bufdelete(n)
        end,
        indicator = {
          style = "underline",
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local icons = {}
          if diag.error then
            table.insert(icons, "E" .. diag.error)
          end
          if diag.warn then
            table.insert(icons, "W" .. diag.warn)
          end
          return #icons > 0 and (" " .. table.concat(icons, " ")) or ""
        end,
        offsets = {
          {
            filetype = "snacks_layout_box",
            text = "Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = "thin",
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },
    },
  },
}
