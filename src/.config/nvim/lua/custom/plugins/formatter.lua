return {
  {
    "mhartington/formatter.nvim",
    config = function()
      local util = require "formatter.util"

      local function yastyle()
        return {
          exe = "ya",
          args = {
            "style",
            "--all",
            "-q",
            "--stdin-filename",
            util.escape_path(util.get_current_buffer_file_name()),
          },
          stdin = true,
        }
      end

      if ARCADIA_MODE then
        vim.cmd [[
        augroup FormatAutogroup
          autocmd!
          autocmd User FormatterPost lua if vim.bo.filetype == "yamake" then vim.cmd("e") end
        augroup END
        ]]
      end

      require("formatter").setup {
        filetype = {
          yamake = ARCADIA_MODE and {
            function()
              vim.api.nvim_err_writeln("Current filetype: " .. util.escape_path(util.get_current_buffer_file_name()))
              return {
                exe = "ya",
                args = {
                  "style",
                  "--yamake",
                  "-q",
                  util.escape_path(util.get_current_buffer_file_name()),
                },
              }
            end,
          } or nil,
          go = {
            ARCADIA_MODE and yastyle or require("formatter.filetypes.go").gofmt,
          },
          python = {
            ARCADIA_MODE and yastyle or require("formatter.filetypes.python").black,
          },
          cpp = {
            ARCADIA_MODE and yastyle or require("formatter.filetypes.cpp").clangformat,
          },
          yaml = {
            require("formatter.filetypes.yaml").prettier,
          },
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
        },
      }
    end,
  },
}
