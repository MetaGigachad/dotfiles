return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }
      map({ 'n', 'i', 't' }, '<M-a>', require("harpoon.mark").add_file, opts)
      map({ 'n', 'i', 't' }, '<M-->', require("harpoon.ui").toggle_quick_menu, opts)
      map({ 'n', 'i', 't' }, '<M-1>', function() require("harpoon.ui").nav_file(1) end, opts)
      map({ 'n', 'i', 't' }, '<M-2>', function() require("harpoon.ui").nav_file(2) end, opts)
      map({ 'n', 'i', 't' }, '<M-3>', function() require("harpoon.ui").nav_file(3) end, opts)
      map({ 'n', 'i', 't' }, '<M-4>', function() require("harpoon.ui").nav_file(4) end, opts)
    end,
  }
}
