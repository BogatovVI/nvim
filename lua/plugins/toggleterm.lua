return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { [[<C-\>]], desc = "Переключить терминал (Ctrl + \\)" },Ж
    },
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        direction = "float",
        close_on_exit = true,
        
        float_opts = {
          border = "rounded", 
          winblend = 3,       
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- Специальные настройки навигации внутри самого терминала
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
        
        vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
        vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
        vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
        vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
      end

      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
          _G.set_terminal_keymaps()
        end,
      })
    end,
  },
}
