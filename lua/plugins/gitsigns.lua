return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      current_line_blame = true,
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]h", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Следующий hunk")

        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[h", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Предыдущий hunk")

        map("n", "<leader>hp", gs.preview_hunk, "Превью hunk")
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset hunk")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame строки")
      end,
    },
  },
}
