local config = function()
  vim.g.signify_sign_add = "┃"
  vim.g.signify_sign_change = "┃"
  vim.g.signify_sign_delete = "_"
  vim.g.signify_sign_delete_first_line = "‾"
  vim.g.signify_sign_change_delete = "~"
end

return {
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   config = function() require("gitsigns").setup() end,
  -- },
  not ARCADIA_MODE and {
    "mhinz/vim-signify",
    config = config,
  } or {
    dir = "~/arcadia/junk/torkve/vim/vim-signify",
    config = config,
  },
}
