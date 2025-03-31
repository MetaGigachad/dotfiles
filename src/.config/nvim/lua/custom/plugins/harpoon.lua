return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }
      map({ "n", "i", "t" }, "<leader>ha", require("harpoon.mark").add_file, opts)
      map({ "n", "i", "t" }, "<leader>hf", require("harpoon.ui").toggle_quick_menu, opts)
      map({ "n", "i", "t" }, "<leader>h1", function() require("harpoon.ui").nav_file(1) end, opts)
      map({ "n", "i", "t" }, "<leader>h2", function() require("harpoon.ui").nav_file(2) end, opts)
      map({ "n", "i", "t" }, "<leader>h3", function() require("harpoon.ui").nav_file(3) end, opts)
      map({ "n", "i", "t" }, "<leader>h4", function() require("harpoon.ui").nav_file(4) end, opts)
      map({ "n", "i", "t" }, "<leader>h5", function() require("harpoon.ui").nav_file(5) end, opts)
      map({ "n", "i", "t" }, "<leader>h6", function() require("harpoon.ui").nav_file(6) end, opts)
      map({ "n", "i", "t" }, "<leader>h7", function() require("harpoon.ui").nav_file(7) end, opts)
      map({ "n", "i", "t" }, "<leader>h8", function() require("harpoon.ui").nav_file(8) end, opts)
      map({ "n", "i", "t" }, "<leader>h9", function() require("harpoon.ui").nav_file(9) end, opts)
    end,
  },
}
