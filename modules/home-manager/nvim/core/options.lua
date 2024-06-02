vim.g.mapleader = " "

--line number
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

--clipboard
vim.api.nvim_set_option("clipboard","unnamedplus")

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- tabs & indentation
vim.opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
vim.opt.shiftwidth = 4 -- 4 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- search settings

vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line

-- turn off swapfile
vim.opt.swapfile = false
vim.opt.updatetime = 50


vim.opt.splitbelow = true
vim.opt.splitright = true
