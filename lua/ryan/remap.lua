-- Remaps Ex (file viewer to ' pv')
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- allow dragging selected line(s) up or down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in place when page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in middle of screen when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep copied buffer after replacing selection
vim.keymap.set("x", "<leader>p", "\"_dP")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- nop Q
vim.keymap.set("n", "Q", "<nop>")

-- faster quick fix commands: https://freshman.tech/vim-quickfix-and-location-list/
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- run golines
vim.keymap.set("n", "<leader>fg", "<cmd>:%! $GOPATH/bin/golines<CR>:w<CR>")

-- harpoon specific
vim.keymap.set("n", "<leader>ha", "<cmd>:lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set("n", "<leader>hm", "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<CR>")
vim.keymap.set("n", "1", "<cmd>:lua require('harpoon.ui').nav_file(1)<CR>")
vim.keymap.set("n", "2", "<cmd>:lua require('harpoon.ui').nav_file(2)<CR>")
vim.keymap.set("n", "3", "<cmd>:lua require('harpoon.ui').nav_file(3)<CR>")
vim.keymap.set("n", "4", "<cmd>:lua require('harpoon.ui').nav_file(4)<CR>")
vim.keymap.set("n", "5", "<cmd>:lua require('harpoon.ui').nav_file(5)<CR>")
