local jsFormatters = {
}
return {
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup {
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          json = {
            require("formatter.filetypes.json").prettier,
          },
          javascript = {
            require("formatter.filetypes.typescriptreact").prettier,
          },
          javascriptreact = {
            require("formatter.filetypes.typescriptreact").prettier,
          },
          typescript = {
            require("formatter.filetypes.typescriptreact").prettier,
          },
          typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier,
          },
        }
      }
    end
  }
}
