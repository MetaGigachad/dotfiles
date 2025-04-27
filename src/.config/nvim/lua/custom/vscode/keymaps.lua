local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local vscode = require "vscode-neovim"

-- Leader key
keymap({ "n", "v" }, "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " m"

-- Map system cliboard
keymap({ "n", "v", "x" }, "s", '"+', opts)

-- Comment
keymap("n", "gcc", function() vscode.call "editor.action.commentLine" end, opts)
keymap("v", "gc", function() vscode.call "editor.action.commentLine" end, opts)

-- Indent
keymap("v", ">", function() vscode.call "editor.action.indentLines" end, opts)
keymap("v", "<", function() vscode.call "editor.action.outdentLines" end, opts)

-- Lines
keymap("v", "<leader>lf", function() vscode.call "editor.action.formatSelection" end, opts)
keymap("v", "<leader>ls", function() vscode.call "editor.action.sortLinesAscending" end, opts)

-- Code
keymap("n", "<leader>cf", function() vscode.call "editor.action.formatDocument" end, opts)
keymap("n", "<leader>ca", function() vscode.call "editor.action.quickFix" end, opts)
keymap("n", "<leader>cr", function() vscode.call "editor.action.rename" end, opts)

-- Find
keymap({ "n", "v" }, "<leader>bf", function() vscode.call "opened-editors.openedEditors" end, opts)
keymap({ "n", "v" }, "<leader>ff", function() vscode.call "find-it-faster.findFiles" end, opts)
keymap({ "n", "v" }, "<leader>fg", function() vscode.call "find-it-faster.findWithinFiles" end, opts)
keymap({ "n", "v" }, "<leader>fG", function() vscode.call "find-it-faster.findWithinFilesWithType" end, opts)
keymap({ "n", "v" }, "<leader>fr", function() vscode.call "find-it-faster.resumeSearch" end, opts)
keymap({ "n", "v" }, "<leader>cs", function() vscode.call "editor.action.gotoSymbol" end, opts)

-- File Browser
keymap("n", "<leader>fe", function() vscode.call "vsnetrw.open" end, opts)

-- Clangd
keymap("n", "<leader>ch", function() vscode.call "clangd.switchheadersource" end, opts)

-- Open
keymap("n", "<leader>of", function() vscode.call "newFolder.new" end, opts)
keymap("n", "<leader>on", function() vscode.call "workbench.action.files.openFolderInNewWindow" end, opts)

-- Utils
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)
keymap("n", "<leader>es", ":set spell!<CR>", opts)
keymap("n", "<leader>ew", ":set wrap!<CR>", opts)

-- Command mode unmap
keymap("n", "q:", "", opts)
