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
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
    },
  },
}
