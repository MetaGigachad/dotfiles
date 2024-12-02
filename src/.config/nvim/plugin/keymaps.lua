local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
map("n", "<Space>", "", opts)

-- [[
-- LEADER KEYMAPS
--
-- (b) Buffers:
-- * (f) find
--
-- (c) Code:
-- * (a) action
-- * (d) diagnostics
-- * (f) format
-- * (r) rename
-- * (s) symbols
--
-- (e) Editor:
-- * (c) commands
-- * (s) spell check toggle
--
-- (f) Files:
-- * (e) browse (current buffer location)
-- * (e) explore (cwd)
-- * (f) find
-- * (g) grep
--
-- (g) Git:
-- * (f) files
--
-- (h) Nohlseacrch
--
-- (m) Local leader
--
-- (o) Org
-- * ...
--
-- (s) Search
-- * (m) man pages
--
-- (t) Terminal
-- ]]

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Visual mode selection keeper on indent
map({ "v" }, ">", ">gv", opts)
map({ "v" }, "<", "<gv", opts)

-- Map system clipboard
map({ "n", "v", "x" }, "s", '"+', opts)
-- keymap({ 'n', 'v', 'x' }, '<C-p>', '"+p', opts)
-- keymap('n', '<C-y><C-y>', '"+yy', opts)
-- keymap({ 'v', 'x' }, '<C-y>', '"+y', opts)
-- keymap('v', '<C-x>', '"+x', opts)

-- Neovim controls
map("n", "<A-Esc>", ":qall<CR>", opts)
map({ "i", "t" }, "<A-Esc>", "<C-\\><C-N>:wqall!<CR>", opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map({ "i", "t" }, "<C-h>", "<C-\\><C-N><C-w>h", opts)
map({ "i", "t" }, "<C-j>", "<C-\\><C-N><C-w>j", opts)
map({ "i", "t" }, "<C-k>", "<C-\\><C-N><C-w>k", opts)
map({ "i", "t" }, "<C-l>", "<C-\\><C-N><C-w>l", opts)

-- Window controls
map("n", "<C-q>", "<C-w>q", opts)
map({ "i", "t" }, "<C-q>", "<C-\\><C-N><C-w>q", opts)
map({ "i", "t" }, "<C-w>s", "<C-\\><C-N><C-w>s", opts)
map({ "i", "t" }, "<C-v>v", "<C-\\><C-N><C-w>v", opts)

-- Tab navigation
map("n", "<C-n>", ":tabnext<CR>", opts)
map("n", "<C-p>", ":tabprev<CR>", opts)
map({ "t" }, "<C-n>", "<C-\\><C-N>:tabprev<CR>", opts)
map({ "t" }, "<C-p>", "<C-\\><C-N>:tabnext<CR>", opts)

-- Tab controls
map("n", "<C-t>", ":$tabnew<CR>", opts)
map({ "i", "t" }, "<C-t>", "<C-\\><C-N>:$tabnew<CR>", opts)
map("n", "<C-w><C-w>", ":tabclose<CR>", opts)
map({ "i", "t" }, "<C-w><C-w>", "<C-\\><C-N>:tabclose<CR>", opts)

-- Vertical movements
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Terminal mappings
map("t", "<Esc>", "<C-\\><C-N>", opts)
map("n", "<leader>t", ":terminal<CR>i", opts)
vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber"

-- Utils
map("n", "<leader>h", ":nohlsearch<CR>", opts)
map("n", "<leader>es", ":set spell!<CR>", opts)

-- Command mode unmap
map("n", "q:", "", opts)

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    map("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
    map("n", "gl", vim.diagnostic.open_float, { buffer = args.buf })
    map("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
    map("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf })
    map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })
    map({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, { buffer = args.buf })
    map({ "n", "v" }, "<leader>cF", ":Format<CR>", { buffer = args.buf })
    map("n", "<leader>cr", vim.lsp.buf.rename, { buffer = args.buf })
  end,
})

-- Telescope
local telescope = require "telescope"
telescope.builtin = require "telescope.builtin"
map("n", "<leader>bf", telescope.builtin.buffers, opts)
map("n", "<leader>cd", telescope.builtin.diagnostics, opts)
map("n", "<leader>ec", telescope.builtin.commands, opts)
map("n", "<leader>fb", telescope.extensions.file_browser.file_browser, opts)
map("n", "<leader>fa", function() telescope.builtin.find_files { hidden = true, no_ignore = true, no_ignore_parent = true } end, opts)
map("n", "<leader>fe", ":Telescope file_browser path=%:p:h<CR>", opts)
map("n", "<leader>ff", function() telescope.builtin.find_files { hidden = true } end, opts)
map("n", "<leader>fg", telescope.builtin.live_grep, opts)
map("n", "<leader>gf", telescope.builtin.git_files, opts)
map("n", "<leader>cs", telescope.builtin.lsp_document_symbols, opts)
map("n", "<leader>sm", function() telescope.builtin.man_pages { sections = { "ALL" } } end, opts)
