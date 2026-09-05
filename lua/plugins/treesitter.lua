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

local function attach(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    return
  end

  local ok = pcall(vim.treesitter.start, buf)
  if not ok then
    return
  end

  vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

  local win = vim.fn.bufwinid(buf)
  if win > 0 then
    vim.wo[win].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[win].foldmethod = "expr"
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
        callback = function(ev)
          attach(ev.buf)
        end,
      })

      attach(vim.api.nvim_get_current_buf())
    end,
  },
}
