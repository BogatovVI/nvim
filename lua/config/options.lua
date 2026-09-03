vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.laststatus = 3
opt.showmode = false
opt.winborder = "rounded"

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true

opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.updatetime = 400
opt.startofline = false
opt.guicursor = "i:block"
opt.clipboard = "unnamedplus"

opt.undofile = true
opt.undolevels = 10000
opt.swapfile = false
opt.backup = false

opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "▾",
  foldclose = "▸",
  foldsep = " ",
  diff = "╱",
}
