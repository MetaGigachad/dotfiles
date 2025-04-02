return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }
      map({ "n" }, "<leader>ha", require("harpoon.mark").add_file, opts)
      map({ "n" }, "<leader>hf", require("harpoon.ui").toggle_quick_menu, opts)
      map({ "n" }, "<leader>h1", function() require("harpoon.ui").nav_file(1) end, opts)
      map({ "n" }, "<leader>h2", function() require("harpoon.ui").nav_file(2) end, opts)
      map({ "n" }, "<leader>h3", function() require("harpoon.ui").nav_file(3) end, opts)
      map({ "n" }, "<leader>h4", function() require("harpoon.ui").nav_file(4) end, opts)
      map({ "n" }, "<leader>h5", function() require("harpoon.ui").nav_file(5) end, opts)
      map({ "n" }, "<leader>h6", function() require("harpoon.ui").nav_file(6) end, opts)
      map({ "n" }, "<leader>h7", function() require("harpoon.ui").nav_file(7) end, opts)
      map({ "n" }, "<leader>h8", function() require("harpoon.ui").nav_file(8) end, opts)
      map({ "n" }, "<leader>h9", function() require("harpoon.ui").nav_file(9) end, opts)
    end,
  },
}
