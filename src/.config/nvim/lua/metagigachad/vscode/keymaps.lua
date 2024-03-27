local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local vscode = require 'vscode-neovim'

-- Leader key
keymap({'n', 'v'}, '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' m'

-- Map system cliboard
keymap({ 'n', 'v', 'x' }, 's', '"+', opts)

-- Comment
keymap('n', 'gcc', function() vscode.call 'editor.action.commentLine' end, opts)
keymap('v', 'gc', function() vscode.call 'editor.action.commentLine' end, opts)

-- Indent
keymap('v', '<Tab>', function() vscode.call 'editor.action.indentLines' end, opts)
keymap('v', '<S-Tab>', function() vscode.call 'editor.action.outdentLines' end, opts)

-- Lines
keymap('v', '<leader>lf', function() vscode.call 'editor.action.formatSelection' end, opts)
keymap('v', '<leader>ls', function() vscode.call 'editor.action.sortLinesAscending' end, opts)

-- Code
keymap('n', '<leader>cf', function() vscode.call 'editor.action.formatDocument' end, opts)
keymap('n', '<leader>ca', function() vscode.call 'editor.action.quickFix' end, opts)

-- Find
keymap('n', '<leader>fg', function() vscode.call 'workbench.action.findInFiles' end, opts)
keymap('n', '<leader>ff', function() vscode.call 'workbench.action.quickOpen' end, opts)
keymap('n', '<leader>fo', function() vscode.call 'workbench.action.files.openFile' end, opts)

-- Open
keymap('n', '<leader>of', function() vscode.call 'newFolder.new' end, opts)
keymap('n', '<leader>on', function() vscode.call 'workbench.action.files.openFolderInNewWindow' end, opts)

-- Utils
keymap('n', '<leader>h', ':nohlsearch<CR>', opts)

-- Command mode unmap
keymap('n', 'q:', '', opts)
