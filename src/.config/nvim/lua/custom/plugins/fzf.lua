return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {
      "hide",
      winopts = {
        fullscreen = false,
        backdrop = 100,
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        treesitter = {
          enabled = true,
        },
        on_create = function()
            vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
            vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
            vim.keymap.set("t", "<C-h>", "", { silent = true, buffer = true })
            vim.keymap.set("t", "<C-l>", "", { silent = true, buffer = true })
        end,
      },
    },
  },
}
