local M = {}

local function files_filter_for_buffer()
  if vim.bo.buftype ~= "" then
    return nil
  end
  local ext = vim.fn.expand("%:e")
  if ext == "" then
    return nil
  end
  return "*." .. ext
end

local function build_opts(extra_prefills)
  local prefills = vim.tbl_extend("force", {
    filesFilter = files_filter_for_buffer(),
  }, extra_prefills or {})

  return {
    transient = true,
    prefills = prefills,
  }
end

function M.open_centered_win()
  local width = math.min(vim.o.columns - 2, math.max(80, math.floor(vim.o.columns * 0.8)))
  local height = math.min(vim.o.lines - 4, math.max(20, math.floor(vim.o.lines * 0.8)))
  vim.api.nvim_open_win(0, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    border = "rounded",
    zindex = 50,
  })
end

function M.open(extra_prefills)
  local opts = build_opts(extra_prefills)
  if not opts.prefills.search then
    opts.prefills.search = vim.fn.expand("<cword>")
  end
  require("grug-far").open(opts)
end

function M.open_visual(extra_prefills)
  require("grug-far").with_visual_selection(build_opts(extra_prefills))
end

return M
