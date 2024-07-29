return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
        },
      }

      -- require("treesitter-context").setup {
      --   mode = "topline",
      --   max_lines = 5,
      -- }

      vim.keymap.set(
        "n",
        "[c",
        function() require("treesitter-context").go_to_context(vim.v.count1) end,
        { silent = true }
      )

      require('nvim-ts-autotag').setup()
      vim.cmd "hi! link @tag.attribute @parameter"
    end,
  },
}
