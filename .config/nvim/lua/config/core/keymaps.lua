vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
-- 入れたはいいけど、Fnを前提とするHHKBのキー配置上使うことが無さそう？
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment 
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement


