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
    opts = function()
      local mocha = require("catppuccin.palettes").get_palette("mocha")
      local selected_bg = mocha.surface0
      return {
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
            icon = "▎",
            style = "icon",
          },
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(_, _, diag)
            local icons = {}
            if diag.error then
              table.insert(icons, "\u{f015a} " .. diag.error)
            end
            if diag.warn then
              table.insert(icons, "\u{f002a} " .. diag.warn)
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
        highlights = require("catppuccin.special.bufferline").get_theme({
          styles = { "bold" },
          custom = {
            all = {
              fill = { bg = "NONE" },
              background = { fg = mocha.overlay0, bg = "NONE" },
              buffer_visible = { fg = mocha.overlay1, bg = "NONE" },
              buffer_selected = { fg = mocha.text, bg = selected_bg, style = { "bold" } },

              separator = { fg = mocha.surface1, bg = "NONE" },
              separator_visible = { fg = mocha.surface1, bg = "NONE" },
              separator_selected = { fg = mocha.surface1, bg = selected_bg },

              indicator_selected = { fg = mocha.lavender, bg = selected_bg },
              indicator_visible = { fg = mocha.surface1, bg = "NONE" },

              modified = { fg = mocha.peach, bg = "NONE" },
              modified_visible = { fg = mocha.peach, bg = "NONE" },
              modified_selected = { fg = mocha.peach, bg = selected_bg },

              error = { fg = mocha.red, bg = "NONE" },
              error_visible = { fg = mocha.red, bg = "NONE" },
              error_selected = { fg = mocha.red, bg = selected_bg, style = { "bold" } },
              error_diagnostic = { fg = mocha.red, bg = "NONE" },
              error_diagnostic_visible = { fg = mocha.red, bg = "NONE" },
              error_diagnostic_selected = { fg = mocha.red, bg = selected_bg },

              warning = { fg = mocha.yellow, bg = "NONE" },
              warning_visible = { fg = mocha.yellow, bg = "NONE" },
              warning_selected = { fg = mocha.yellow, bg = selected_bg, style = { "bold" } },
              warning_diagnostic = { fg = mocha.yellow, bg = "NONE" },
              warning_diagnostic_visible = { fg = mocha.yellow, bg = "NONE" },
              warning_diagnostic_selected = { fg = mocha.yellow, bg = selected_bg },

              hint_selected = { fg = mocha.teal, bg = selected_bg, style = { "bold" } },
              hint_diagnostic_selected = { fg = mocha.teal, bg = selected_bg },
              info_selected = { fg = mocha.sky, bg = selected_bg, style = { "bold" } },
              info_diagnostic_selected = { fg = mocha.sky, bg = selected_bg },
              diagnostic_selected = { fg = mocha.subtext0, bg = selected_bg, style = { "bold" } },
              numbers_selected = { fg = mocha.subtext0, bg = selected_bg, style = { "bold" } },
              duplicate_selected = { fg = mocha.text, bg = selected_bg, style = { "bold" } },
            },
          },
        }),
      }
    end,
  },
}
