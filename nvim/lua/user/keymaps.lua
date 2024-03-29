local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
--[[ keymap("n", "<C-h>", "<C-w>h", opts) ]]
--[[ keymap("n", "<C-j>", "<C-w>j", opts) ]]
--[[ keymap("n", "<C-k>", "<C-w>k", opts) ]]
--[[ keymap("n", "<C-l>", "<C-w>l", opts) ]]

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Better half page scrolling
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)

-- Better search page scrolling
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- format on save
vim.api.nvim_command("autocmd BufWritePre *.py lua vim.lsp.buf.format(nil, 1000)")
vim.api.nvim_command("autocmd BufWritePre *.html lua vim.lsp.buf.format(nil, 1000)")
vim.api.nvim_command("autocmd BufWritePre *.css lua vim.lsp.buf.format(nil, 1000)")
vim.api.nvim_command("autocmd BufWritePre *.scss lua vim.lsp.buf.format(nil, 1000)")
--[[ vim.api.nvim_command("autocmd BufWritePre *.js EslintFixAll") ]]
vim.api.nvim_command("autocmd BufWritePre *.js lua vim.lsp.buf.format(nil, 1000)")
--[[ vim.api.nvim_command("autocmd BufWritePre *.js lua vim.lsp.buf.formatting()") ]]

--[[ -- autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR> ]]
vim.api.nvim_command("autocmd BufWritePre *.jsx lua vim.lsp.buf.format(nil, 1000)")
vim.api.nvim_command("autocmd BufWritePre *.ts lua vim.lsp.buf.format(nil, 1000)")
vim.api.nvim_command("autocmd BufWritePre *.tsx lua vim.lsp.buf.format(nil, 1000)")
vim.api.nvim_command("autocmd BufWritePre *.lua lua vim.lsp.buf.format(nil, 1000)")
vim.api.nvim_command("autocmd BufWritePre *.json lua vim.lsp.buf.format(nil, 1000)")
vim.api.nvim_command("autocmd BufWritePre *.yaml lua vim.lsp.buf.format(nil, 1000)")

-- test on save for test files (neotest)
--[[ vim.api.nvim_command("autocmd BufWritePre *.test.js lua require('neotest').run.run(vim.fn.expand('%'))") ]]
--[[ vim.api.nvim_command("autocmd BufWritePre *.test.jsx lua require('neotest').run.run(vim.fn.expand('%'))") ]]
--[[ vim.api.nvim_command("autocmd BufWritePre *.test.ts lua require('neotest').run.run(vim.fn.expand('%'))") ]]
--[[ vim.api.nvim_command("autocmd BufWritePre *.test.tsx lua require('neotest').run.run(vim.fn.expand('%'))") ]]

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Search & replace word under cursor
keymap("n", "<leader>o", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left><C-w>", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
