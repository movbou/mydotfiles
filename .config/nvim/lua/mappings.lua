require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undo Tree" })

-- Disable arrow keys in normal, insert, and visual modes
map({'n', 'i', 'v'}, '<Up>', '<Nop>')
map({'n', 'i', 'v'}, '<Down>', '<Nop>')
map({'n', 'i', 'v'}, '<Left>', '<Nop>')
map({'n', 'i', 'v'}, '<Right>', '<Nop>')
