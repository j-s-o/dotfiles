local opt = vim.opt
opt.encoding = "utf-8"
-- replace tabs with spaces
opt.expandtab = true
opt.nu = true
-- relative line count from highlighted line
opt.relativenumber = true
opt.errorbells = false
opt.wrap = false
opt.smartcase = true
opt.swapfile = false
opt.backup = false
opt.incsearch = true
opt.autoindent = true
opt.hlsearch = false
opt.completeopt = "menu,menuone,noselect"
opt.sw = 2
opt.ts = 2
opt.sts = 2
opt.fillchars = {eob = " "}
opt.cmdheight = 0
vim.o.winborder = "rounded"

vim.o.laststatus = 0
vim.o.signcolumn = "yes:1"
