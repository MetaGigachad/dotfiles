return {
  {
    "mhartington/formatter.nvim",
    config = function()
      local util = require "formatter.util"

      local function yastyle()
        local path = util.escape_path(util.get_current_buffer_file_path());
        return {
          exe = 'tr "" "" >/dev/null; zsh -c \'output="$(~/arcadia/ya style --yamake ' .. path .. ' --dry-run --no-diff 2>/dev/null | tail -n +3)"; [ -z "$output" ] && cat ' .. path .. ' || print "$output"\'',
          stdin = true,
          no_append = true,
        }
      end

      require("formatter").setup {
        filetype = {
          yamake = ARCADIA_MODE and yastyle or nil,
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
