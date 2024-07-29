return {
  {
    "EdenEast/nightfox.nvim",
    dependencies = {
      "dasupradyumna/midnight.nvim",
    },
    config = function() vim.cmd.colorscheme "carbonfox"
      vim.api.nvim_set_hl(0, 'CursorLine', {})
      vim.cmd("hi! link TreesitterContext Folded")
      vim.cmd("hi! link TreesitterContextLineNumber Folded")
    end,
  },
}
