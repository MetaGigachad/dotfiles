local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' m'

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

-- Map system clipboard to P and Y
keymap({ 'n', 'v', 'x' }, 's', '"+', opts)
-- keymap({ 'n', 'v', 'x' }, '<C-p>', '"+p', opts)
-- keymap('n', '<C-y><C-y>', '"+yy', opts)
-- keymap({ 'v', 'x' }, '<C-y>', '"+y', opts)
-- keymap('v', '<C-x>', '"+x', opts)

-- Neovim controls
keymap('n', '<A-Esc>', ':qall<CR>', opts)
keymap({ 'i', 't' }, '<A-Esc>', '<C-\\><C-N>:wqall!<CR>', opts)

-- Buffer control mappings
keymap('n', '<A-n>', ':bn<CR>', opts)
keymap('n', '<A-N>', ':bp<CR>', opts)
keymap('n', '<A-c>', ':bdelete!<CR>', opts)
keymap({ 'i', 't' }, '<A-n>', '<C-\\><C-N>:bn<CR>', opts)
keymap({ 'i', 't' }, '<A-N>', '<C-\\><C-N>:bp<CR>', opts)
keymap({ 'i', 't' }, '<A-c>', '<C-\\><C-N>:bdelete<CR>', opts)

-- Window navigation
keymap('n', '<A-h>', '<C-w>h', opts)
keymap('n', '<A-j>', '<C-w>j', opts)
keymap('n', '<A-k>', '<C-w>k', opts)
keymap('n', '<A-l>', '<C-w>l', opts)
keymap({ 'i', 't' }, '<A-h>', '<C-\\><C-N><C-w>h', opts)
keymap({ 'i', 't' }, '<A-j>', '<C-\\><C-N><C-w>j', opts)
keymap({ 'i', 't' }, '<A-k>', '<C-\\><C-N><C-w>k', opts)
keymap({ 'i', 't' }, '<A-l>', '<C-\\><C-N><C-w>l', opts)

-- Window controls
keymap('n', '<A-q>', '<C-w>q', opts)
keymap('n', '<A-s>', '<C-w>s:Ex<CR>', opts)
keymap('n', '<A-v>', '<C-w>v:Ex<CR>', opts)
keymap({ 'i', 't' }, '<A-q>', '<C-\\><C-N><C-w>q', opts)
keymap({ 'i', 't' }, '<A-s>', '<C-\\><C-N><C-w>s:Ex<CR>', opts)
keymap({ 'i', 't' }, '<A-v>', '<C-\\><C-N><C-w>v:Ex<CR>', opts)

-- Tab navigation
keymap('n', '<A-!>', ':1tabnext<CR>', opts)
keymap('n', '<A-@>', ':2tabnext<CR>', opts)
keymap('n', '<A-#>', ':3tabnext<CR>', opts)
keymap('n', '<A-$>', ':4tabnext<CR>', opts)
keymap({ 'i', 't' }, '<A-1>', '<C-\\><C-N>:1tabnext<CR>', opts)
keymap({ 'i', 't' }, '<A-2>', '<C-\\><C-N>:2tabnext<CR>', opts)
keymap({ 'i', 't' }, '<A-3>', '<C-\\><C-N>:3tabnext<CR>', opts)
keymap({ 'i', 't' }, '<A-4>', '<C-\\><C-N>:4tabnext<CR>', opts)

-- Tab controls
keymap('n', '<A-t>', ':$tabnew<CR>:Ex<CR>', opts)
keymap({ 'i', 't' }, '<A-t>', '<C-\\><C-N>:$tabnew<CR>:Ex<CR>', opts)
keymap('n', '<A-w>', ':tabclose<CR>', opts)
keymap({ 'i', 't' }, '<A-w>', '<C-\\><C-N>:tabclose<CR>', opts)

-- Vertical movements
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- Terminal mappings
keymap('t', '<Esc>', '<C-\\><C-N>', opts)
keymap('n', '<leader>t', ':terminal<CR>i', opts)

-- Utils
keymap('n', '<leader>h', ':nohlsearch<CR>', opts)
keymap('n', '<leader>es', ':set spell!<CR>', opts)

-- Command mode unmap
keymap('n', 'q:', '', opts)

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        keymap('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
        keymap('n', 'gl', vim.diagnostic.open_float, { buffer = args.buf })
        keymap('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
        keymap('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf })
        keymap('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = args.buf })
        keymap('n', '<leader>cf', vim.lsp.buf.format, { buffer = args.buf })
        keymap('n', '<leader>cr', vim.lsp.buf.rename, { buffer = args.buf })
    end,
})

-- Telescope
local telescope = require 'telescope'
telescope.builtin = require 'telescope.builtin'
keymap('n', '<leader>bf', telescope.builtin.buffers, opts)
keymap('n', '<leader>cd', telescope.builtin.diagnostics, opts)
keymap('n', '<leader>ec', telescope.builtin.commands, opts)
keymap('n', '<leader>fb', telescope.extensions.file_browser.file_browser, opts)
keymap('n', '<leader>fe', ':Telescope file_browser path=%:p:h<CR>', opts)
keymap('n', '<leader>ff', telescope.builtin.find_files, opts)
keymap('n', '<leader>fg', telescope.builtin.live_grep, opts)
keymap('n', '<leader>gf', telescope.builtin.git_files, opts)
keymap('n', '<leader>cs', telescope.builtin.lsp_document_symbols, opts)
keymap('n', '<leader>sm', function() telescope.builtin.man_pages { sections = { 'ALL' } } end, opts)

-- Harpoon
local harpoon = require 'harpoon'
keymap({ 'n', 'i', 't' }, '<M-a>', function() harpoon:list():append() end, opts)
keymap({ 'n', 'i', 't' }, '<M-->', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
keymap({ 'n', 'i', 't' }, '<M-1>', function() harpoon:list():select(1) end, opts)
keymap({ 'n', 'i', 't' }, '<M-2>', function() harpoon:list():select(2) end, opts)
keymap({ 'n', 'i', 't' }, '<M-3>', function() harpoon:list():select(3) end, opts)
keymap({ 'n', 'i', 't' }, '<M-4>', function() harpoon:list():select(4) end, opts)
