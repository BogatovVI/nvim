return {
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Открыть LazyGit во весь экран", silent = true },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
    end,
  },
}
