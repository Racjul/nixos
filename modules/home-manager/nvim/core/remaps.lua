local set = vim.opt
local cmd = vim.cmd
local o = vim.o

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Center de screen after moving from a demi-page
vim.keymap.set({"n","i","v"},"<C-d>","<C-d>zz")

vim.keymap.set({"n","i","v"},"<C-u>","<C-u>zz")

--Shortcuts for windows
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sx", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height

--Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

--Harpoon keymaps
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file,{desc="Mark file for harpoon"})
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu,{desc="Open harpoon Menu"})
vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end)
vim.keymap.set("n", "<C-5>", function() ui.nav_file(5) end)
vim.keymap.set("n", "<C-6>", function() ui.nav_file(6) end)
vim.keymap.set("n", "<C-7>", function() ui.nav_file(7) end)
vim.keymap.set("n", "<C-8>", function() ui.nav_file(8) end)
vim.keymap.set("n", "<C-9>", function() ui.nav_file(9) end)
vim.keymap.set("n", "<C-0>", function() ui.nav_file(0) end)

--Other keymaps
vim.keymap.set("n","<leader>t","<cmd>TagbarToggle<cr>",{desc="Toggle Tabgbar"})
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle,{desc="Toggle Undotree"})
vim.keymap.set("n","<C-t>","<CMD>ToggleTerm<CR>", {desc = "Open Terminal"})
