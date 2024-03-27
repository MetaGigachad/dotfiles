if vim.g.vscode then
    require 'metagigachad.vscode.keymaps'
else
    require 'metagigachad.lazy'
    require 'metagigachad.comment'
    require 'metagigachad.git'
    require 'metagigachad.lualine'
    require 'metagigachad.telescope'
    require 'metagigachad.colorscheme'
    require 'metagigachad.keymaps'
    require 'metagigachad.options'
end
