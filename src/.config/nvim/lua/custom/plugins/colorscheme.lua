return {
  {
    "EdenEast/nightfox.nvim",
    dependencies = {
      "dasupradyumna/midnight.nvim",
    },
    config = function()
      if vim.env.THEME_STYLE == "light" then
        vim.cmd.colorscheme "dayfox"
      else
        vim.cmd.colorscheme "carbonfox"
      end
      vim.api.nvim_set_hl(0, "CursorLine", {})
      vim.cmd "hi! link TreesitterContext Folded"
      vim.cmd "hi! link TreesitterContextLineNumber Folded"
      vim.cmd "hi! link @tag.attribute Function"
    end,
  },
}
