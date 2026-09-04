return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      float = {
        transparent = true,
        solid = false,
      },
      dim_inactive = {
        enabled = false,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
      },
      custom_highlights = function(colors)
        return {
          NormalFloat = { bg = colors.none },
          FloatBorder = { bg = colors.none, fg = colors.blue },
          FloatTitle = { bg = colors.none, fg = colors.blue },
          NormalNC = { link = "Normal" },
          WinSeparator = { fg = colors.surface0 },
          SnacksNormal = { link = "Normal" },
          SnacksNormalNC = { link = "Normal" },
          SnacksPicker = { link = "Normal" },
          SnacksPickerBorder = { link = "FloatBorder" },
          SnacksPickerInput = { link = "Normal" },
          SnacksBackdrop = { bg = colors.none },
        }
      end,
      integrations = {
        blink_cmp = true,
        dap = true,
        dap_ui = true,
        gitsigns = true,
        harpoon = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = { enabled = true },
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotest = true,
        noice = true,
        notify = true,
        snacks = {
          enabled = true,
          indent_scope_color = "lavender",
        },
        treesitter = true,
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
