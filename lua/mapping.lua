
local osname = vim.loop.os_uname().sysname
local keyset = vim.keymap.set

-- [[ Basic Keymaps ]]
vim.g.mapleader = " "

-- Keymaps for better default experience
-- See `:help keyset()`
keyset({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keyset('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keyset('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- buffer 
keyset('n', '<c-h>', "<cmd>bp<CR>", {silent = true })
keyset('n', '<c-l>', "<cmd>bn<CR>", {silent = true })

keyset('n', '<leader>bc', "<cmd>bdelete<CR>", {silent = true })

if (osname == "Linux") then
  keyset('n', '<leader>be', ':edit <c-r>=expand("%:p:h")<CR>/')
else
  keyset('n', '<leader>be', ':edit <c-r>=expand("%:p:h")<CR>\\')
end

keyset('n', '<leader>bh', ':edit ~/')

-- sourcing
keyset('n', '<leader>so', ":source %<CR>")

-- Diagnostic keymaps
keyset('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keyset('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keyset('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keyset('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- move lines

keyset("v", "<c-j>", ":join<CR>")

keyset("v", "J", ":m '>+1<CR>gv=gv")
keyset("v", "K", ":m '<-2<CR>gv=gv")

keyset("n", "J", "mzJ`z")
keyset("n", "<C-d>", "<C-d>zz")
keyset("n", "<C-u>", "<C-u>zz")
keyset("n", "n", "nzzzv")
keyset("n", "N", "Nzzzv")


-- greatest remap ever
keyset("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keyset({"n", "v"}, "<leader>y", [["+y]])
keyset("n", "<leader>Y", [["+Y]])

keyset({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
keyset("i", "<C-c>", "<Esc>")

-- fix list

keyset("n", "<C-k>", "<cmd>cnext<CR>zz")
keyset("n", "<C-j>", "<cmd>cprev<CR>zz")
keyset("t", "<C-k>", "<esc><cmd>cnext<CR>zz")
keyset("t", "<C-j>", "<esc><cmd>cprev<CR>zz")
keyset("n", "<leader>k", "<cmd>lnext<CR>zz")
keyset("n", "<leader>j", "<cmd>lprev<CR>zz")

-- terminal
keyset("t", "<esc>", "<C-\\><C-n>")
