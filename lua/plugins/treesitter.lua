return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local parsers = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "json",
        "yaml",
        "toml",
        "bash",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "rust",
      }

      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
        callback = function(ev)
          local ok = pcall(vim.treesitter.start, ev.buf)
          if not ok then
            return
          end

          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo[0][0].foldmethod = "expr"
        end,
      })
    end,
  },
}
