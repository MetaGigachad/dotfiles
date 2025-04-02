return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }
      map({ "n" }, "<leader>na", require("harpoon.mark").add_file, opts)
      map({ "n" }, "<leader>nf", require("harpoon.ui").toggle_quick_menu, opts)
      map({ "n" }, "<leader>n1", function() require("harpoon.ui").nav_file(1) end, opts)
      map({ "n" }, "<leader>n2", function() require("harpoon.ui").nav_file(2) end, opts)
      map({ "n" }, "<leader>n3", function() require("harpoon.ui").nav_file(3) end, opts)
      map({ "n" }, "<leader>n4", function() require("harpoon.ui").nav_file(4) end, opts)
      map({ "n" }, "<leader>n5", function() require("harpoon.ui").nav_file(5) end, opts)
      map({ "n" }, "<leader>n6", function() require("harpoon.ui").nav_file(6) end, opts)
      map({ "n" }, "<leader>n7", function() require("harpoon.ui").nav_file(7) end, opts)
      map({ "n" }, "<leader>n8", function() require("harpoon.ui").nav_file(8) end, opts)
      map({ "n" }, "<leader>n9", function() require("harpoon.ui").nav_file(9) end, opts)
    end,
  },
}
