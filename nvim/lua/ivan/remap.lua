vim.keymap.set("n", "<leader>vp", vim.cmd.Ex)

-- Allows me to move lines of code when selecting them
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeps page centered as I go up and down the document
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keeps searches centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allows me to paste over a selection without losing the current buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Allows me to copy words to my clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- ALlows me to see hover suggestions
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- Save on <C-s>
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
