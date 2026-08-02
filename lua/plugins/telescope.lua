return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = "Поиск файлов по имени" },
      { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = "Поиск текста по всему проекту" },
      { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = "Поиск по открытым буферам" },
      { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = "Поиск по справке Neovim" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      
      telescope.setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { 
              prompt_position = "top", 
              preview_width = 0.55 
            },
          },
        },
      })
      
      telescope.load_extension("fzf")
    end,
  },
}
