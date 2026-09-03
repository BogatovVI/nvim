return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost" },
    config = function()
      local lint = require("lint")
      local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/golangci-lint"

      lint.linters_by_ft = {
        go = { "golangcilint" },
      }

      if vim.fn.executable(mason_bin) == 1 then
        lint.linters.golangcilint.cmd = mason_bin
      end

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("NvimLint", { clear = true }),
        callback = function()
          if vim.bo.filetype ~= "go" then
            return
          end
          if vim.fn.executable(lint.linters.golangcilint.cmd) ~= 1 then
            return
          end
          lint.try_lint()
        end,
      })
    end,
  },
}
