local function open(extra_prefills)
  require("config.grug_far").open(extra_prefills)
end

local function open_visual(extra_prefills)
  require("config.grug_far").open_visual(extra_prefills)
end

return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = { "GrugFar", "GrugFarWithin" },
    opts = {
      headerMaxWidth = 80,
      minSearchChars = 2,
      wrap = false,
      windowCreationCommand = "lua require('config.grug_far').open_centered_win()",
      -- Leader = пробел, поэтому Replace/Close без <localleader>, иначе which-key ждёт rg/ca.
      keymaps = {
        replace = { n = "R" },
        close = { n = "q" },
      },
    },
    config = function(_, opts)
      require("grug-far").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("GrugFarKeymaps", { clear = true }),
        pattern = "grug-far",
        callback = function(ev)
          local function close_far()
            require("grug-far").kill_instance(ev.buf)
          end
          for _, key in ipairs({ "<C-h>", "<C-j>", "<C-k>", "<C-l>" }) do
            vim.keymap.set("n", key, close_far, { buffer = ev.buf, desc = "Закрыть поиск/замену" })
          end
        end,
      })
    end,
    keys = {
      {
        "<leader>fs",
        function()
          open()
        end,
        mode = "n",
        desc = "Замена по проекту",
      },
      {
        "<leader>fs",
        function()
          open_visual()
        end,
        mode = "x",
        desc = "Замена по проекту",
      },
      {
        "<leader>fS",
        function()
          open({ paths = vim.fn.expand("%") })
        end,
        mode = "n",
        desc = "Замена в текущем файле",
      },
      {
        "<leader>fS",
        function()
          open_visual({ paths = vim.fn.expand("%") })
        end,
        mode = "x",
        desc = "Замена в текущем файле",
      },
    },
  },
}
