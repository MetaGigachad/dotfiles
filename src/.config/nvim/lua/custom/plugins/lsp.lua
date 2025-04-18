return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("neodev").setup()

      require("mason").setup()
      require("mason-lspconfig").setup()

      require("lspconfig").clangd.setup {
        filetypes = { "c", "cpp" },
      }

      require("mason-lspconfig").setup_handlers {
        function(server_name)
          if server_name == "clangd" then
            require("lspconfig")[server_name].setup {
              filetypes = { "c", "cpp" },
            }
          elseif server_name == "gopls" and ARCADIA_MODE then
            require("lspconfig")[server_name].setup {
              cmd = { "ya", "tool", "gopls", "serve" },
              settings = {
                gopls = {
                  arcadiaIndexDirs = {
                    vim.fn.expand "~/arcadia/library/go",
                    vim.fn.expand "~/arcadia/yabs/dooh/backend/main",
                  },
                  expandWorkspaceToModule = false,
                },
              },
            }
          else
            require("lspconfig")[server_name].setup {}
          end
        end,
      }
    end,
  },
}
