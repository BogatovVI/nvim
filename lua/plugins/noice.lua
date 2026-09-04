return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      notify = { enabled = false },
      presets = {
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = {
          border = { style = "rounded" },
          position = { row = "30%", col = "50%" },
          size = { width = 60, height = "auto" },
        },
        cmdline_popupmenu = {
          border = { style = "rounded" },
          position = { row = "35%", col = "50%" },
          size = { width = 60, height = 10 },
        },
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
    },
  },
}
